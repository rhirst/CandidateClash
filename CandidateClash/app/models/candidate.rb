require 'rest-client'

class Candidate
  def initialize(first_name, last_name, name_slug, cid, number_of_statements, photo_cred)
    @first_name = first_name.titleize
    @last_name = last_name
    @number_of_statements = number_of_statements
    @photo_cred = photo_cred
    @cid = cid
    @name_slug = name_slug
  end

  attr_reader :first_name, :last_name, :name_slug, :cid, :number_of_statements, :photo_cred
  
  def full_name
    @first_name +' ' + @last_name
  end
  
  def image_url
    "/assets/#{name_slug}.jpg"
  end

  def statements
    @statements ||= JSON.parse(RestClient.get("http://www.politifact.com/api/statements/truth-o-meter/people/#{name_slug}/json/?n=#{@number_of_statements}"))
  end

  def contributions
    @contributions ||= JSON.parse(RestClient.get("http://www.opensecrets.org/api/?method=candIndustry&cid=#{cid}&apikey=91fe970ceab795a947f82e19baa64fef&output=json"))
    rescue => e
      @contributions ||= {"response"=>{"industries"=>{"industry"=>[{"@attributes"=>{"industry_code"=>"", "industry_name"=>"No Contributions Available", "indivs"=>"", "pacs"=>"", "total"=>""}}]}}}
  end

#  def finances
#    @finances ||= JSON.parse(RestClient.get("http://api.nytimes.com/svc/elections/us/v3/finances/2016/president/candidates/{#{last_name}}[,#{first_name}] | committee-ID}[.json]?api-key={a0fae42f24ebb864e1f9fe068421139d:2:72004955}[&callback={callback-function}]"))
#    rescue => e
#      @finances = ["industries"]["industry"][i]["industry_name"]
#      
#  end

  def party
    #@party = statements[0]["speaker"]["party"]["party"]
    #rescue => e
    #@party = "none"
    i=0

    while statements[i]["speaker"]["name_slug"] != name_slug && i < 5 do
        
        puts @party
        puts name_slug
        puts statements[i]["speaker"]["name_slug"]
        puts statements[i]["speaker"]["party"]["party"]
        i+=1
    end
    @party = statements[i]["speaker"]["party"]["party"]
  end

  def credability
    @credability = 0.0
    statement_count = 0
    statements.each do |statement|
      if name_slug === statement["speaker"]["name_slug"]
        statement_count += 1
        ruling = statement["ruling"]["ruling_slug"]
        puts ruling
        case ruling
          when "true"
            @credability +=4
          when "mostly-true"
            @credability +=3
          when "half-true"
            @credability +=2
          when "barely-true"
            @credability +=1
          when "false"
            @credability +=0
        end
      end
    end
    puts @credability
    @credability /= (4 * statement_count) 
    puts @credability
    @credability *= 100
  end

end

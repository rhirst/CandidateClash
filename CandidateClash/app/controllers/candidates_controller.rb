class CandidatesController < ApplicationController
  def index
    @candidates = [
      Candidate.new('Hillary', 'Clinton', 'hillary-clinton','N00000019', 5,'<a href="http://commons.wikimedia.org/wiki/File:Hillary_Clinton_official_Secretary_of_State_portrait_crop.jpg#/media/File:Hillary_Clinton_official_Secretary_of_State_portrait_crop.jpg">Photo</a> by <a rel="nofollow" class="external text" href="http://www.state.gov/r/pa/ei/pix/115472.htm">US Department Of State</a>. Public Domain via <a href="//commons.wikimedia.org/wiki/">Wikimedia Commons</a>.' ),
      Candidate.new('Ted', 'Cruz', 'ted-cruz', 'N00033085', 5, "<a href='http://commons.wikimedia.org/wiki/File:Ted_Cruz,_official_portrait,_113th_Congress.jpg#/media/File:Ted_Cruz,_official_portrait,_113th_Congress.jpg'>"+"Photo "+"</a>"+"by Office of Senator Ted Cruz. Licensed under Public Domain"),
  		#Candidate.new('Lincoln', 'Chafee', 'lincoln-chafee', 'N00009954', 5, "<a href='http://en.wikipedia.org/wiki/Lincoln_Chafee#/media/File:Lincoln_Chafee_official_portrait.jpg'>Lincoln Chafee official portrait</a>Public Domain via Wikimedia Commons"),
      Candidate.new('Bernie', 'Sanders', 'bernie-s', 'N00000528', 5, "<a href='http://commons.wikimedia.org/wiki/File:Bernie_Sanders.jpg#/media/File:Bernie_Sanders.jpg'>Photo</a> by United States Congress, Licensed under Public Domain"),
      Candidate.new('Marco', 'Rubio', 'marco-rubio', 'N00030612', 5, "<a href='http://en.wikipedia.org/wiki/Marco_Rubio#/media/File:Marco_Rubio,_Official_Portrait,_112th_Congress.jpg'>Photo</a> by US Senate Licensed under Public Domain"),
      Candidate.new('Jim', 'Webb', 'jim-webb', 'N00028058', 5,  "<a href='http://commons.wikimedia.org/wiki/File:Jim_Webb_official_110th_Congress_photo.jpg#/media/File:Jim_Webb_official_110th_Congress_photo.jpg'> Photo</a> by United States Senate Licensed under Public Domain"),
      Candidate.new('Rand', 'Paul', 'rand-paul', 'N00030836', 5, "<a href='http://commons.wikimedia.org/wiki/File:Rand_Paul,_official_portrait,_112th_Congress_alternate.jpg#/media/File:Rand_Paul,_official_portrait,_112th_Congress_alternate.jpg'> Photo</a> by United States Senate Licensed under Public Domain")]
  end

  def show
    @candidate = Candidate.new(params[:first_name], params[:last_name], params[:name_slug], params[:cid], params[:number_of_statements], params[:photo_cred])
  end
end

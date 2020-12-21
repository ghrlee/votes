class SinatraPracticeApp < Sinatra::Base
  get '/' do
    @states = State.all
    @profiles = Profile.new

    # erb :"blogs/new"
    erb :"index"
  end

  get '/blogs/:id' do
    @blog = Blog.find(params[:id])
    erb :'blogs/show'
  end

  get '/profiles' do
    @profiles = Profile.new
  end

  post '/' do
    blog = Blog.new(params["blog"])
    if blog.save
      redirect "/blogs/#{blog.id}"
    else
      erb :"blogs/new"
    end
  end
end
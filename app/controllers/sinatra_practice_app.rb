class SinatraPracticeApp < Sinatra::Base
  get '/' do
    @states = State.all

    # erb :"blogs/new"
    erb :"index"
  end

  get '/states/:name' do
    @state = State.find_by(name: params[:name])
    erb :'states/show'
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
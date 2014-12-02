# run `ruby overlord.rb` to run a webserver for this app
require 'sinatra'
require_relative 'models/bomb'
enable :sessions

get '/' do
    # session.clear
    @bomb = bomb()
    erb :index
end

post '/' do
    bomb.activate(params[:active_code])
    redirect '/'
end


before '/deactivate' do
    # Or just get rid of this XHR thing altogether...
    if !request.xhr?
        # so something
    end
end

get '/deactivate' do
    if request.xhr?
        # send # => 
        erb :_deactivated, :layout => !request.xhr?
    end
end

post '/deactivate' do
    if request.xhr?
        deactivate_bomb(params[:dcode])
        # redirect "/deactivate"
        erb :_deactivated, :layout => !request.xhr?
    end
end


def bomb
    session[:bomb] ||= Bomb.new
end

def activate_bomb(code)
    bomb.activate(code)
end

def deactivate_bomb(code)
    session[:bomb].deactivate(code)
end

# we can shove stuff into the session cookie YAY!
def start_time
    session[:start_time] ||= (Time.now).to_s
end

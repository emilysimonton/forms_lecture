require 'bundler'
Bundler.require
Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Base
    #routes
    get '/form' do
      erb :form
    end

    get "/people" do
      @people = Person.all
      erb :people
    end

    post '/results' do
      person = Person.new(params[:name])
      @people = [person]
      person.save
      erb :people
    end

    get "/multiform" do
      erb :multiform
    end

    post '/somerandomURL' do
      erb :show
    end

  end
end

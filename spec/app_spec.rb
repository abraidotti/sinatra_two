ENV['RACK_ENV'] = 'test'

require_relative '../app.rb'  # <-- your sinatra app
require 'rspec'
require 'sinatra'
require 'rack/test'
require 'pry'

describe 'App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Hello World')
  end

  it "/about renders the about page dog" do
    get '/about'
    expect(last_response).to be_ok
    expect(last_response.body).to include('<h1>About</h1>')
  end

  it "/contact renders the contact page dog" do
    get '/contact'
    expect(last_response).to be_ok
    expect(last_response.body).to include('<h1>Contact</h1>')
  end


end

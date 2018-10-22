require 'sinatra'

require 'weather'

class App < Sinatra::Application
  get '/' do
    'Hello World'
  end
end

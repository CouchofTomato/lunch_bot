require 'sinatra/base'

module SlackLunchbot
  class Web < Sinatra::Base
    get '/' do
      'good for you.'
    end
  end
end

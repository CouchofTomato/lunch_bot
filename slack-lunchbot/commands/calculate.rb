module SlackLunchbot
  module Commands
    class Talk < SlackRubyBot::Commands::Base
      command 'Hey' do |client, data, _match|
        client.say(channel: data.channel, text: 'Wazaaaaaaap')
      end
    end


  end
end

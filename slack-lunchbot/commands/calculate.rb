module SlackLunchbot
  module Commands
    class Talk < SlackRubyBot::Commands::Base

      command 'Hey' do |client, data, _match|
        client.say(channel: data.channel, text: 'Wazaaaaaaap')
      end

      command 'start' do |client, data, _match|
        client.say(channel: data.channel, text: "#{data.user}")
      end

      command 'Yes' do |client, data, _match|
        arr = []
        arr << "<@#{data.user}>"
        client.say(channel: data.channel, text: arr)
        puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
        puts arr
      end


    end
  end
end

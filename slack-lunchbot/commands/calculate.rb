module SlackLunchbot
  module Commands
    class Talk < SlackRubyBot::Commands::Base

      arr = []

      command 'Hey' do |client, data, _match|
        client.say(channel: data.channel, text: 'Wazaaaaaaap')
      end

      command 'start' do |client, data, _match|
        client.say(channel: data.channel, text: "#{data.user}")
      end

      command 'Yes' do |client, data, _match|

        arr << "<@#{data.user}>"
        client.say(channel: data.channel, text: arr)
        puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
        puts arr
        puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
        puts arr
      end

      command 'stop' do |client, data, _match|
        newArr = arr.each_slice(1).to_a
        client.say(channel: data.channel, text: newArr)
      end


    end
  end
end

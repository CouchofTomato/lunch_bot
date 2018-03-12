module SlackLunchbot
  module Commands
    class Talk < SlackRubyBot::Commands::Base

      arr = []

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
        shuffleTotal = arr.shuffle
        splitIntoGroups = (shuffleTotal.length / 5).ceil
        c = shuffleTotal.length / splitIntoGroups
        d = shuffleTotal.each_slice(c).to_a

        groups = d.each do |group|
          number = 0
          group = "group" + number.to_s
          number += 1
        end

        client.say(channel: data.channel, text: d)
      end


    end
  end
end

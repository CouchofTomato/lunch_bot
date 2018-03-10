module SlackLunchbot
  module Commands
    class Talk < SlackRubyBot::Commands::Base
      command 'Hey' do |client, data, _match|
        client.say(channel: data.channel, text: 'Wazaaaaaaap')
      end

      command 'start' do |client, data, _match|
        peopleGoing = 0
        client.say(channel: data.channel, text: 'If you are going to lunch at 13:00 today, Please leave a comment below saying Yes!' + peopleGoing)
        peopleGoing += 1

      end

    end


  end
end

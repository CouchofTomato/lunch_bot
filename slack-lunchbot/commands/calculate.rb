module SlackLunchbot
  module Commands
    class Talk < SlackRubyBot::Commands::Base

      users_going = nil

      #Bot listens for "start" command, then asks question
      command 'start' do |client, data, _match|
        users_going = BotMethods.new
        client.say(channel: data.channel, text: "Hey everyone! Please comment to '@lunch-slack-bot with' :+1: if you are coming to lunch today!")
      end

      #Bot listens for confirmation emoji being added into the channel and adds the user to an array
      command ':+1:' do |client, data, _match|
        users_going.add_user data.user
        client.say(channel: data.channel, text: "<@#{data.user}>" + " has been added to the list")
        puts "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
      end

      command 'who is going so far?' do |client, data, _match|
        client.say(channel: data.channel, text: "#{users_going.list_users_going(users_going.users_going)}")
      end

      #the array of people is shuffled, divided equally into groups of 5 and added to an array with a group name Eg - 'group-1'
      command 'stop' do |client, data, _match|
        users_going.create_lunch_groups

        users_going.user_lunch_groups.each_with_index do |group, index|
          client.say(channel: data.channel, text: "Group #{index+1}: #{users_going.list_users_going(group)}")
        end
      end


    end
  end
end

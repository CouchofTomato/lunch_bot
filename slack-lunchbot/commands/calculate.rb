module SlackLunchbot
  module Commands
    class Talk < SlackRubyBot::Commands::Base

      arr = []
      groupsArr = []

      #Bot listens for "start" command, then asks question
      command 'start' do |client, data, _match|
        client.say(channel: data.channel, text: "Hey everyone! Please comment with :+1: if you are coming to lunch today!")
      end

      #Bot listens for confirmation emoji being added into the channel and adds the user to an array
      command ':+1:' do |client, data, _match|
        arr << "<@#{data.user}>"
        client.say(channel: data.channel, text: "<@#{data.user}>" + " has been added to the list")
      end

      command 'who is going so far?' do |client, data, _match|
        client.say(channel: data.channel, text: arr)
      end

      #the array of people is shuffled, divided equally into groups of 5 and added to an array with a group name Eg - 'group-1'
      command 'stop' do |client, data, _match|
        shuffleTotal = arr.shuffle
        splitIntoGroups = (shuffleTotal.length / 5).ceil
        c = shuffleTotal.length / splitIntoGroups
        d = shuffleTotal.each_slice(c).to_a

        d.each.with_index do |group, index|
          groupsArr << "Group #{index+1}: #{group.join(', ')}"
        end

        groupsArr.each do |group|
          shuffleGroup = group.shuffle
          puts group + "Your leader this week is " +
        end


        client.say(channel: data.channel, text: groupsArr)
      end


    end
  end
end

module SlackLunchbot
  class LunchGoers
    attr_accessor :lunchers, :lunch_groups

    def initialize
      @lunchers = []
      @lunch_groups = nil
    end

    def add_luncher slack_username
      self.lunchers << slack_username
    end

    def list_lunchers group = nil
      if group
        group.map {|luncher| "<@#{luncher}>" }.join(", ")
      else
        lunchers.map {|luncher| "<@#{luncher}>" }.join(", ")
      end
    end

    def create_lunch_groups
      self.lunch_groups = divide_lunchers_into_groups.to_a
    end

    private

    def divide_lunchers_into_groups
      lunchers.shuffle.each_slice(group_numbers)
    end

    def group_numbers
      lunchers.length / ((lunchers.length / 7.0).ceil)
    end
  end
end

module SlackLunchbot
  module Commands
    class Talk < SlackRubyBot::Commands::Base

      lunchers = nil

      #Bot listens for "start" command, then asks question
      command 'start' do |client, data, _match|
        lunchers = LunchGoers.new
        client.say(channel: data.channel, text: "Hey everyone! Please comment with :+1: if you are coming to lunch today!")
      end

      #Bot listens for confirmation emoji being added into the channel and adds the user to an array
      command ':+1:' do |client, data, _match|
        lunchers.add_luncher data.user
        client.say(channel: data.channel, text: "<@#{data.user}>" + " has been added to the list")
      end

      command 'who is going so far?' do |client, data, _match|
        client.say(channel: data.channel, text: "#{lunchers.list_lunchers}")
      end

      #the array of people is shuffled, divided equally into groups of 5 and added to an array with a group name Eg - 'group-1'
      command 'stop' do |client, data, _match|
        lunchers.create_lunch_groups

        lunchers.lunch_groups.each_with_index do |group, index|
          client.say(channel: data.channel, text: "Group #{index+1}: #{lunchers.list_lunchers(group)}")
        end
      end

    end
  end
end

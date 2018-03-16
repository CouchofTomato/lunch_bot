module SlackLunchbot
  class BotMethods
    using LunchBotRefinements
    attr_accessor :users_going, :user_lunch_groups

    def initialize
      @users_going = []
      @user_lunch_groups = nil
    end

    def add_user slack_username
      self.users_going << slack_username
    end

    def list_users_going group
      group.map {|user_going| "<@#{user_going}>" }.join(", ")
    end

    def create_lunch_groups
      self.user_lunch_groups = divide_users_going_into_groups
    end

    private

    def divide_users_going_into_groups
      shuffle_users
      self.users_going = users_going.split group_numbers
    end

    def shuffle_users
      users_going.shuffle!
    end

    def group_numbers
      (users_going.length / 7.0).ceil
    end

    # def appoint_leader
    # end

  end
end

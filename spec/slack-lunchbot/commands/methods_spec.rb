RSpec.describe SlackLunchbot::BotMethods do
  let(:bot_methods) { SlackLunchbot::BotMethods.new }

  describe '#add_user' do
    context 'when the user hasn\'t already been added' do
      it 'adds them to the users_going array' do
        bot_methods.add_user "Reece"
        expect(bot_methods.users_going).to eq ["Reece"]
      end

      it 'returns true' do
        expect(bot_methods.add_user("David")).to be true
      end
    end

    context 'when the user has already been added' do
      it 'doesn\'t add them to the users_going array' do
        bot_methods.add_user "Reece"
        bot_methods.add_user "Reece"
        expect(bot_methods.users_going).to eq ["Reece"]
      end

      it 'returns false' do
        bot_methods.add_user "Reece"
        expect(bot_methods.add_user("Reece")).to be false
      end
    end
  end
end

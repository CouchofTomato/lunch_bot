RSpec.describe '#split' do
  using SlackLunchbot::LunchBotRefinements
  
  let(:users_going_to_lunch) { [1,2,3,4,5,6,7,8,9,10] }
  
  describe '#split' do
    it 'divides an array into sub-arrays of equal size' do
      expect(users_going_to_lunch.split(2)).to eq [[1,2,3,4,5],[6,7,8,9,10]]
    end
  end
end

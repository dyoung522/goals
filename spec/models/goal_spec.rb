require 'rails_helper'

RSpec.describe Goal, :type => :model do
  before { @goal = FactoryGirl.create(:goal) }

  it { should belong_to(:user)     }
  it { should belong_to(:category) }
  it { should have_many(:updates)  }

  it { should validate_presence_of(:topic) }

  context '#complete?' do
    it 'false when date_completed nil' do
      @goal.date_completed = nil
      expect(@goal.complete?).to eq(false)
    end

    it 'true when date_completed is set' do
      @goal.date_completed = DateTime.now
      expect(@goal.complete?).to eq(true)
    end
  end

end

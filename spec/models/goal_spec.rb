require 'rails_helper'

RSpec.describe Goal, :type => :model do
  before { @goal = FactoryGirl.create(:goal) }

  it { should belong_to(:user)     }
  it { should belong_to(:category) }
  it { should have_many(:updates)  }

  it { should_not be_complete }

  it 'should be complete when completed' do
    @goal.date_completed = DateTime.now
    expect(@goal).to be_complete
  end


end

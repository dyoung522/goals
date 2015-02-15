require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = create(:user) }

  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email) }

  it { should have_one(:address_book) }
  it { should have_many(:contacts) }
  it { should have_many(:goals) }
end

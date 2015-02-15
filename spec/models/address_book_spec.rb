require 'rails_helper'

RSpec.describe AddressBook, :type => :model do
  it { should have_and_belong_to_many(:contacts) }
  it { should belong_to(:user) }
end

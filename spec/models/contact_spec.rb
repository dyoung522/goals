require 'rails_helper'

RSpec.describe Contact, :type => :model do
  before { @contact = create(:contact) }

  it { should have_and_belong_to_many :address_books }
  it { should have_many :users }
  it { should validate_uniqueness_of(:email) }

  it 'should be active by default' do
    expect(@contact).to be_active
  end

  it 'should not be active when inactive' do
    @contact.active = false
    expect(@contact).to_not be_active
  end
end

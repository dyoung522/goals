require 'rails_helper'

RSpec.describe Update, :type => :model do
  it { should belong_to(:goal) }
end

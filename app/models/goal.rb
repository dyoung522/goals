class Goal < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many   :updates, :dependent => :destroy

  validates_presence_of :topic

  def complete?
    !date_completed.nil?
  end
end

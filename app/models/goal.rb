class Goal < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many   :updates

  def complete?
    !date_completed.nil?
  end
end

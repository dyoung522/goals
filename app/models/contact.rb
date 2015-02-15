class Contact < ActiveRecord::Base
  validates_uniqueness_of :email

  has_and_belongs_to_many :address_books
  has_many :users, :through => :address_books
end

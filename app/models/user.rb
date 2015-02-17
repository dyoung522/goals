class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates_uniqueness_of :email

  has_many :goals, :dependent => :destroy
  has_one  :address_book, :dependent => :destroy
  has_many :contacts, :through => :address_book
end

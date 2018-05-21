class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable

  has_many :wikis

  before_save { self.email = email.downcase }
  before_save { self.role ||= :standard }

  enum role: [:standard, :premium, :admin]
end

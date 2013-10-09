# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password

  validates :name, uniqueness: true
  validates :name, length: { minimum: 2 }
  validates :email, uniqueness: true
  validates :password, length: {in: 6..20}

end

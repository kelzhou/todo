# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  date        :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#

class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :title, :user_id

  validates :user, :title, :date, :presence => true

  scope :meeting, -> { where('title = ?', "Meeting")}
  scope :date, -> { where('title = ?', "Date")}
  scope :others, lambda { {:conditions => ['title != ? AND title != ?', "Meeting", "Date"]} }
end

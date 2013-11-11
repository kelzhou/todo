# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  class_name :string(255)
#  homework   :string(255)
#  due_date   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  complete   :bool
#  completed  :boolean
#

class Assignment < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :class_name, :homework, :due_date, :user_id, :completed

  scope :incomplete, -> { where(completed: false).order(:homework)}
  scope :complete, -> { where(completed: true).order(:homework)}

end

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
#

class Assignment < ActiveRecord::Base
  attr_accessible :class_name, :homework, :due_date
end

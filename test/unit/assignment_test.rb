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

require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

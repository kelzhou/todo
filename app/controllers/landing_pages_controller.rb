class LandingPagesController < ApplicationController
  def home
    @assignments_incomplete = Assignment.incomplete.sort_by! { |m| m.due_date }
    @count = 0
  	def resource_name
    	:user
  	end
 
  	def resource
    	@resource ||= User.new
  	end
 
  	def devise_mapping
    	@devise_mapping ||= Devise.mappings[:user]
  	end

  end


end

class AssignmentsController < ApplicationController
  
  def new
  	@assignment = Assignment.new
  end

  def index
  	@assignments = Assignment.all
  end

  def create
	@assignment = Assignment.new(params[:assignment])
	if @assignment.save
		redirect_to assignments_path
	else
		render 'new'
	end
  end

end

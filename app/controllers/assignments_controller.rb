class AssignmentsController < ApplicationController
  
  def index
    @assignments_complete = Assignment.complete
    @assignments_incomplete = Assignment.incomplete
  end

  def new
  	@assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(params[:assignment])
    if @assignment.save
		  redirect_to assignments_path
    else
		  render 'new'
    end
  end

  def edit 
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(params[:assignment])
      redirect_to assignments_path
    else
      render 'edit'
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to assignments_path
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

end

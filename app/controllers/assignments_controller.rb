class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @assignments_complete = Assignment.complete.sort_by! { |m| m.due_date }
    @assignments_incomplete = Assignment.incomplete.sort_by! { |m| m.due_date }
  end

  def new
  	@assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(params[:assignment])
    @assignment.completed = false;
    if @assignment.save
      client = Postmark::ApiClient.new('2cb38ae3-d143-4150-9dca-cbe8939c1858')
      client.deliver(from: 'zhouwe@seas.upenn.edu',
               to: current_user.email,
               subject: 'New Assignment Creatation',
               html_body: "Hi #{current_user.email},<br><br>You just created a new assignment!
                          <p>Check it out on the app!<br><br>
                          Thanks, The Personal Planner App (http://kellysplanner.herokuapp.com/)")
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

  def complete
    @assignment = Assignment.find(params[:id])
    @assignment.completed = true;
    if @assignment.save
      redirect_to assignments_path
    else
      render 'edit'
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    client = Postmark::ApiClient.new('2cb38ae3-d143-4150-9dca-cbe8939c1858')
    client.deliver(from: 'zhouwe@seas.upenn.edu',
               to: current_user.email,
               subject: 'Deleted Assignment',
               html_body: "Hi #{current_user.email},<br><br>You just deleted an assignment.
                          <p>Check it out on the app!<br><br>
                          Thanks, The Personal Planner App (http://kellysplanner.herokuapp.com/)")
    @assignment.destroy
    redirect_to assignments_path
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

end

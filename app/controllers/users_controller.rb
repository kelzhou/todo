class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  	@users = User.all
  end

  def new
    @user = User.new
  end

  def create
		@user = User.new(params[:user])
		if @user.save
      client = Postmark::ApiClient.new('2cb38ae3-d143-4150-9dca-cbe8939c1858')
      client.deliver(from: 'zhouwe@seas.upenn.edu',
               to: @user.email,
               subject: 'New User Creatation',
               html_body: "Hi #{@user.name},<br><br><b>Congrats, you just created a new user!</b>
                          <br><br>Thanks, The Personal Planner App")
			redirect_to users_path
		else
			render 'new'
		end
 	end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      client = Postmark::ApiClient.new('2cb38ae3-d143-4150-9dca-cbe8939c1858')
      client.deliver(from: 'zhouwe@seas.upenn.edu',
               to: @user.email,
               subject: 'User Updated',
               html_body: "Hi #{@user.name},<br><br><b>Congrats, you just updated your user!</b>
                          <br><br>Thanks, The Personal Planner App")
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    client = Postmark::ApiClient.new('2cb38ae3-d143-4150-9dca-cbe8939c1858')
    client.deliver(from: 'zhouwe@seas.upenn.edu',
               to: @user.email,
               subject: 'User Deleted',
               html_body: "Hi #{@user.name},<br><br><b>This is to confirm that you just deleted a user.</b>
                          <br><br>Thanks, The Personal Planner App")
    @user.destroy
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  # def resource_name
  #   :user
  # end
 
  # def resource
  #   @resource ||= User.new
  # end
 
  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:user]
  # end

end

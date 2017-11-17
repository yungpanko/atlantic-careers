class ApplicationsController < ApplicationController
  before_action :require_login, only: [:show, :index, :create, :destroy]

  def new
  end

  def create
    @application = Application.new
    job = Job.find(params[:job])
    @application.job = job
    @application.user = User.find(params[:user])
    if @application.valid?
        flash[:success] = 'Job Saved!'
        @application.save
      else
        flash.now[:danger] = []
        @application.errors.full_messages.each do |error|
          flash.now[:danger] << error
        end
    end
    redirect_to company_path(Company.find(job.company.id))
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    redirect_to user_path(current_user)
  end

end

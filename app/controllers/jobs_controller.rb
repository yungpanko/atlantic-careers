class JobsController < ApplicationController
  before_action :require_login, only: [:show, :index]
  before_action :require_admin, only: [:edit, :update, :destroy]


  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new
    @job.title = job_params[:title]
    @job.link = job_params[:link]
    @job.deadline = job_params[:deadline]
    @job.location = job_params[:location]
    @job.company = Company.find(job_params[:company_id])
    @job.creator = current_user
    if @job.valid?
      @job.save
      redirect_to company_path(@job.company)
    else
      flash.now[:danger] = []
      @job.errors.full_messages.each do |error|
        flash.now[:danger] << error
      end
      @company = @job.company
      @companies = Company.all
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :link, :deadline, :location, :company_id)
  end

end

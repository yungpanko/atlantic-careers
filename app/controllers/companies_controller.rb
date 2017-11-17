class CompaniesController < ApplicationController
  before_action :require_login, only: [:show, :index]
  before_action :require_admin, only: [:edit, :update, :destroy]


  def index
    @companies = Company.all
    @current_user = current_user
  end

  def show
    @company = Company.find(params[:id])
    @current_user = current_user
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.creator = current_user
    if @company.valid?
      @company.save
      redirect_to company_path(@company)
    else
      flash.now[:danger] = []
      @company.errors.full_messages.each do |error|
        flash.now[:danger] << error
      end
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :industry)
  end

end

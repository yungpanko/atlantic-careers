class CompaniesController < ApplicationController
  before_action :require_login, only: [:show, :index]
  before_action :require_admin, only: [:edit, :update, :destroy]


  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.creator = current_user.id
    if @company.valid?
      @company.save
      redirect_to company_path(@company)
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
    @company.destroy
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :industry)
  end

end

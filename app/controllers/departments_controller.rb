class DepartmentsController < ApplicationController

  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @department = Department.all
  end

  def show
  end

  def new
    @department = Department.new
    render partial: "form"
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to department_path(@department)
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @department.update(department_params)
      redirect_to department_path(@department)
    else
      render :edit
    end
  end

  def destroy
    @department.destroy
   
    redirect_to departments_path
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    # return a hash like object {name:'value'}
    params.require(:department).permit(:name)
  end
end

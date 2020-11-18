class DepartmentsController < ApplicationController
  def index
    @department = Department.all
  end

  def show
    @department = Department.find(params[:id])
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
    @department = Department.find(params[:id])
    render partial: "form"
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
      redirect_to @department 
    else
      render :edit
    end
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

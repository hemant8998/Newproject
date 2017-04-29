class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def relocation_request

  end

  def index
    @employees = Employee.all  
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
   
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @managers = Employee.where('id IN (SELECT manager_id FROM employees)')
   
  end

  # GET /employees/1/edit
  def edit
    @managers = Employee.where('id IN (SELECT manager_id FROM employees)')
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
     @managers = Employee.where('id IN (SELECT manager_id FROM employees)')

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    # byebug
     @employee = Employee.find(params[:id])
    @employee.update(employee_params)
  @managers = Employee.where('id IN (SELECT manager_id FROM employees)')
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :city_id, :manager_id, :willing_to_relocate, :photo)
    end
end

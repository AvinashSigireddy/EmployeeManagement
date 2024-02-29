class EmployeesController < ApplicationController
  before_action :set_employee, only: :show

  # GET /employees/1
  def show
    render json: TaxCalculationService.call(@employee), status: :ok and return
  end 

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee
    else
      render json: { sucess: false, errors: @employee.errors.full_messages} , status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:emp_id, :first_name, :last_name, :email, :doj, :salary_per_month, :phones_attributes => [:phone_type, :phone_no])
    end
end

class TaxCalculationService < ApplicationService
  def initialize employee
    @employee = employee
    @salary_per_month = employee.salary_per_month
  end
  
  attr_reader :employee, :salary_per_month

  def call
    {
      employee_id: employee.emp_id,
      first_name: employee.first_name,
      last_name: employee.last_name,
      annual_salary: annual_salary,
      tax_amount: tax_amount.round(2),
      cess_amount: cess_amount
    }
  end

  def annual_salary
    salary_per_month * 12
  end

  def cess_amount
    (annual_salary > 2500000) ? (annual_salary * 2.0/100) : 0
  end
  
  def tax_amount
    taxable_salary = received_amount - 250000
    unless taxable_salary.positive?
      return 0
    end
    if taxable_salary <= 250000
      tax = taxable_salary * 5.0/100
    elsif taxable_salary <= 750000
      tax = ((250000)*(5.0/100)) + ((taxable_salary-250000)*(10.0/100))
    elsif taxable_salary > 750000
      tax = ((250000)*(5.0/100)) + ((500000)*(10.0/100)) + (taxable_salary - 750000)*(20.0/100)
    end    
  end

  def received_amount
    doj =  employee.doj
    deducted_days = (doj - doj.beginning_of_month).to_i
    start_month = deducted_days.zero? ? (doj.month) : (doj.month + 1)
    @received_salary ||= if doj.month >= 4
      end_date = Date.new(Time.now.year,12,31)
      unless deducted_days.zero?
        (salary_per_month * ((end_date.month+1 - start_month)+3)) +(salary_per_month - (salary_per_month/deducted_days))
      else
        (salary_per_month * ((end_date.month+1 - start_month)+3))
      end
    else
      end_date = Date.new(Time.now.year,3,31)
      unless deducted_days.zero?
        (salary_per_month * (end_date.month+1 - start_month)) + (salary_per_month - (salary_per_month/deducted_days))
      else
        (salary_per_month * (end_date.month+1 - start_month))
      end
    end
  end
end
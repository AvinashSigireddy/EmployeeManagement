# README

A Rails Api only app with 2 Api routes one to add employee entry and other for tax_calculation

Prerequisites
-------------
- Ruby 3.2.0
- Rails 7.0.8.1
- Node V14+

Getting Started
---------------
Follow these instructions to get the application up and running on your local machine.

- Install the required gems:
   bundle install
- Set up the database:
   rails db:create
   rails db:migrate

- Start the Rails server:
   rails server
- Open your web browser and navigate to http://localhost:3000 to access the application.

API
--------
- Employee creation, request_type: POST
   ```
     curl --location 'http://localhost:3000/employees' \
        --data-raw '{
            "employee": {
                "emp_id": "IND331",
                "first_name": "Avinash123",
                "last_name": "Sigireddy",
                "doj": "12/04/2021",
                "email": "avinash@email.com",
                "salary_per_month": "98000",
                "phones_attributes": [{
                    "phone_type": "Home",
                    "phone_no": "2732691"
                },{
                    "phone_type": "primary",
                    "phone_no": "9999991233"
                }]
            }
        }'

- Get employee details with tax_calculation, request_type: GET
  ```
    curl --location 'http://localhost:3000/employees/5'
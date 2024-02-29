class Employee < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :emp_id, presence: true, uniqueness: true
  validates :salary_per_month, presence: true
  validates :doj, presence: true

  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones
end

class Phone < ApplicationRecord
  belongs_to :employee
  validates :phone_no, presence: true
end

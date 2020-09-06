class Computer < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :department
end

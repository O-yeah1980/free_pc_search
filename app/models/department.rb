class Department < ApplicationRecord
  has_many :users
  has_many :computers
  has_ancestry
end

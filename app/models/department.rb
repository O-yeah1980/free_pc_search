class Department < ApplicationRecord
  has_many :users
  has_ancestry
end

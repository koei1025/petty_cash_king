class LookupSort < ApplicationRecord
    validates_presence_of :sort, :name
    validates_uniqueness_of :sort
  
    has_many :lookups, inverse_of: :lookup_sort
  
    accepts_nested_attributes_for :lookups
end

class Lookup < ApplicationRecord
    validates_presence_of :code, :name

    belongs_to :lookup_sort, inverse_of: :lookups
end

Rails.application.eager_load! if Rails.env.development?
class JobParameter < ApplicationRecord
  validates_presence_of :code, :name, :parameter_type, :show_flag

  belongs_to :job_define
end

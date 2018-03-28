class JobDefine < ApplicationRecord
    validates_presence_of :name
    validates_uniqueness_of :name
  
    has_many :job_parameters, dependent: :destroy
    # has_many :job_monitors, class_name: 'SidekiqJobMonitor', foreign_key: 'job_define_id'
  
    def print_worker_type
      case worker_type
      when 'Worker'
        '工作'
      when 'Report'
        '报表'
      end
    end
  end
  
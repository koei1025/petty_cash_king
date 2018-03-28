class JobDefinesController < ApplicationController
    # load_and_authorize_resource
    before_action :set_job_define, only: %i[edit update destroy]
  
    def index
      @job_defines = JobDefine.all
      session[:return_to_index] = request.original_url
    end
  
    def new
      @job_define = JobDefine.new
      session[:return_to] = request.original_url
    end
  
    def edit
      session[:return_to] = request.original_url
    end
  
    def create
      @job_define = JobDefine.new(job_define_params)
  
      if @job_define.save
        redirect_to job_defines_path, notice: '添加完成'
      else
        redirect_to job_defines_path, alert: '添加失败，设置重复'
      end
    end
  
    def update
      if @job_define.update(job_define_params)
        redirect_to job_defines_path, notice: '更新完成'
      else
        redirect_to job_defines_path, alert: '更新失败，设置重复'
      end
    end
  
    def destroy
      @job_define.destroy
      redirect_to job_defines_path, notice: '删除成功'
    end
  
    private
  
    def set_job_define
      @job_define = JobDefine.find(params[:id])
    end
  
    def job_define_params
      params.require(:job_define).permit(:job_class, 
                                         :name, 
                                         :mutual_exclusion, 
                                         :system_only, 
                                         :worker_type,
                                         :report_code)
    end
  end
  
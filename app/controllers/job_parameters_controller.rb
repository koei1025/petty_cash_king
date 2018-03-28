class JobParametersController < ApplicationController
    before_action :set_job_define
    before_action :set_job_parameter, only: %i[edit update destroy]
    before_action :set_lookup_sort, only: %i[new edit]
    before_action :set_lookup_relation, only: %i[new edit]
  
    def new
      @job_parameter = @job_define.job_parameters.new(show_flag: true, required: true, allow_all: false)
    end
  
    def edit; end
  
    def create
      @job_parameter = @job_define.job_parameters.new(job_parameter_params)
      if @job_parameter.save
        redirect_to edit_job_define_path(@job_define), notice: '完成'
      else
        redirect_to edit_job_define_path(@job_define), alert: '添加失败，内容重复'
      end
    end
  
    def update
      if @job_parameter.update(job_parameter_params)
        redirect_to edit_job_define_path(@job_define), notice: '完成'
      else
        redirect_to edit_job_define_path(@job_define), alert: '更新失败，内容重复'
      end
    end
  
    def destroy
      @job_parameter.destroy
      redirect_to edit_job_define_path(@job_define), notice: '删除成功'
    end
  
    private
  
    def set_lookup_sort
      @lookup_sort = LookupSort.all
      @lookup_model = ApplicationRecord.descendants.collect(&:name)
    end
  
    def set_lookup_relation
      @lookup_relation = JobParameter.where(parameter_type: %w[Lookup Model]).where(job_define_id: @job_define.id)
    end
  
    def set_job_define
      @job_define = JobDefine.find(params[:job_define_id])
    end
  
    def set_job_parameter
      @job_parameter = JobParameter.find(params[:id])
    end
  
    def job_parameter_params
      params.require(:job_parameter).permit(:seq, :code, :name, :parameter_type, :default_value, :lookup_sort_id, :hardcode, :show_flag, :lookup_relation, :lookup_model, :lookup_model_key, :lookup_model_value, :relation_filter, :required, :allow_all)
    end
  end
  
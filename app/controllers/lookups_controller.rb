class LookupsController < ApplicationController
    before_action :set_lookup, only: %i[show edit update]
    before_action :set_lookup_sort
  
    def new
      lookup_sort = LookupSort.find(params[:lookup_sort_id])
      @lookup = lookup_sort.lookups.new
    end
  
  
    def create
      lookup_sort = LookupSort.find(params[:lookup_sort_id])
      @lookup = lookup_sort.lookups.new(lookup_params)
  
      if @lookup.save
        redirect_to edit_lookup_sort_path(@lookup_sort), notice: '完成'
      else
        redirect_to edit_lookup_sort_path(@lookup_sort), alert: '添加失败，代码已存在'
      end
    end
    
    def edit 
    end

    def update
      if @lookup.update(lookup_params)
        redirect_to edit_lookup_sort_path(@lookup_sort), notice: '完成'
      else
        redirect_to edit_lookup_sort_path(@lookup_sort), alert: '更新失败'
      end
    end
  
    private
  
    def set_lookup
      @lookup = Lookup.find(params[:id])
    end
  
    def set_lookup_sort
      @lookup_sort = LookupSort.find(params[:lookup_sort_id])
    end
  
    def lookup_params
      params.require(:lookup).permit(:code, :name, :description, :tag, :start_on, :end_on)
    end
  end
  
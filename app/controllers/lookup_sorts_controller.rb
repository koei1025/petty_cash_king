class LookupSortsController < ApplicationController
    # load_and_authorize_resource
    # load_and_authorize_resource :lookups
    before_action :set_lookup_sort, only: %i[edit update]
  
    def index
      @lookup_sorts = LookupSort.all
      session[:return_to_index] = request.original_url
    end
  
    def new
      @lookup_sort = LookupSort.new
    end
  
    def create
      @lookup_sort = LookupSort.new(lookup_sort_params)
  
      if @lookup_sort.save
        redirect_to edit_lookup_sort_path(@lookup_sort), notice: '添加完成'
      else
        redirect_to lookup_sorts_path, alert: '添加失败，代码类型已存在'
      end
    end

    def edit
    end
  
    def update
      if @lookup_sort.update(lookup_sort_params)
        redirect_to edit_lookup_sort_path(@lookup_sort), notice: '更新完成'
      else
        redirect_to lookup_sorts_path, notice: '更新失败'
      end
    end
  
    private
  
    def set_lookup_sort
      @lookup_sort = LookupSort.find(params[:id])
    end
  
    def lookup_sort_params
      params.require(:lookup_sort).permit(:sort, :name, :description)
    end
  end
  
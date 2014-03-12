class CategoriesController < ApplicationController
  before_action :set_category
  before_action :set_params
  def show
    gon.tweets = @tweets = Kaminari.paginate_array(Category.rank).page(params[:page]).per(10)
    gon.type = 1
  end

  def recent
    gon.tweets = @tweets = Kaminari.paginate_array(Category.recent).page(params[:page]).per(10)
    gon.type = 2
  end

  def people
    gon.tweets = @tweets = Kaminari.paginate_array(Category.people).page(params[:page]).per(10)
    gon.type = 3
  end

  private
  def set_category
    @category = Category.find_by(:id => params[:id].to_i)
  end

  def set_params
    Category.set_id = params[:id].to_i
  end
end

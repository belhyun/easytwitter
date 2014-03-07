class CategoriesController < ApplicationController
  before_action :set_category
  def show
    @tweets = Kaminari.paginate_array(Category.find_by(:id => params[:id].to_i).tweets.today.desc(:score)).page(params[:page]).per(10)
    gon.tweets = @tweets
    gon.type = 1
  end

  def recent
    @tweets = Kaminari.paginate_array(Category.find_by(:id => params[:id].to_i).tweets.today.desc(:created_at)).page(params[:page]).per(10)
    gon.tweets = @tweets
    gon.type = 2
  end

  def people
    @tweets = Kaminari.paginate_array(Category.find_by(:id => params[:id].to_i).tweets.today.desc(:name)).page(params[:page]).per(10)
    gon.tweets = @tweets
    gon.type = 3
  end

  private
  def set_category
    @category = Category.find_by(:id => params[:id].to_i)
  end
end

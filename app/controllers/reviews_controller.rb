class ReviewsController < ApplicationController
  helper Spree::BaseHelper
  require_role [:user,:admin], :only => [:submit,:create]

  def index
    if params[:product_id]
      @product = Product.find_by_id params[:product_id]
    else
      @product = Product.find_by_id params[:id]
    end
     @reviews=@product.reviews
  end

  # 
  def submit
    @review = Review.new :product_id => params[:id]
    @product = Product.find_by_id params[:id]
  end

  # save if all ok
  def create
    @review = Review.new :product_id => params[:id],:user_id=>current_user.id
    @product = Product.find_by_id params[:review][:product_id]
    

    if @review.update_attributes(params[:review]) 
      if @product.rating.nil? 
        @product.rating = Rating.create :value => 0, :count => 0
      end
      @product.rating.add_rating(params[:review][:rating].to_i)
      flash[:notice] = t('review_successfully_sumbitted')
      redirect_back_or_default(product_path(@product))
    else
      render :action => "submit" 
    end
  end

end

class PortfoliosController < ApplicationController
  # before_action :set_portfolio_item_params, only: [:show, :edit, :update, :destroy]
  
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def destroy
    @portfolio_item = Portfolio.find(params[:id])
    
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Record was successfully destroyed.' }
    end
  end
  
  private
  
  # def set_portfolio_item_params
  #   params.require(:portfolio_item).permit(:title, :subtitle, :body, :main_image, :thumb_image)
  # end
  
end

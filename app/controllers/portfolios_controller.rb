class PortfoliosController < ApplicationController
  
  def index
    @portfolio_items = Portfolio.all
  end
  
  def new
    @portfolio_item = Portfolio.new
  end
  
  def create
    @portfolio = portfolio.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
  
  private
  
  def portfolion_item_params
      params.require(:portfolio_item).permit(:title, :subtitle, :body, :main_image, :thumb_image)
  end
  
end

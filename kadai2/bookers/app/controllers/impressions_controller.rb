class ImpressionsController < ApplicationController
  def top

  	
  end
  
  def show
  	@impression = Impression.find(params[:id])
  end

  def index
  	@impressions = Impression.all
  	@impression = Impression.new
  end

  def create
  	@impression = Impression.new(impression_params)
    if @impression.save
    flash[:notice] = "Book was successfully created."
  	redirect_to impression_path(@impression.id)
    else
  	render "/index"
    end
  end

  def new
  end

  def edit
  	@impression = Impression.find(params[:id])
  end

  def update
  	impression = Impression.find(params[:id])
  	if impression.update(impression_params)
  	flash[:notice] = "Book was successfully created."
  	redirect_to impression_path(impression.id)
    else 
    	render "/index"
    end
  end
  
  def destroy
  	impression = Impression.find(params[:id])
  	impression.destroy
  	redirect_to impressions_path
  end

  private
  def impression_params
  	params.require(:impression) .permit(:title, :body)
  	
  end
end

class Api::ProductsController < ApplicationController
  def index
    if params[:available].present?
      available = params[:available].to_s.downcase == 'true'
      @products = Product.where(available: available)
    else
      @products = Product.all
    end
    
    render json: @products
  end
  
  def show
    @product = Product.find(params[:id])
    render json: @product
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Product not found' }, status: :not_found
  end
  
  def create
    @product = Product.new(product_params)
    
    if @product.save
      render json: @product, status: :created
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    @product = Product.find(params[:id])
    
    if @product.update(product_params)
      render json: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Product not found' }, status: :not_found
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Product not found' }, status: :not_found
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :description, :price, :available)
  end
end

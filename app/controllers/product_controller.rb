class ProductController < ApplicationController

  before_action :find_product!
  before_action :check_code!

  def show
    render json: {code: @code.id}, status: 200
  end

  private

  def find_product!
    @product = Product.find_by_id(params[:id])
    render nothing: true, status: 404 unless @product
  end

  def check_code!
    @code = @product.find_code_by_bonuse(params[:code])
    render nothing: true, status: 404 unless @code
    render nothing: true, status: 401 unless @code.code_valid?
  end

end

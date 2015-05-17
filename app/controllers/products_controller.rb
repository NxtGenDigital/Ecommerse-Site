class ProductsController < ApplicationController
include PaymentMethod
  def index
  	@product=Product.all
  end

  def edit
    @product=Product.find(params[:id])
  end

  def show
  end

  def new
  	@product=Product.new
  	#@product.build_image,has_one
  	@product.images.build #,has_many
  end
  def create
    params.permit!
    @product=Product.new(params[:product])
    if @product.save
       redirect_to :action=>"index"
    else
       render "new"
    end
  end
  def add_images
  	@product=Product.find(params[:id])
  end
  def adding_images
  	params.permit!
      @product=Product.find(params[:id])
      @image=Image.create(params[:product][:image])
      @image.update_attributes(:entity=>@product)
      redirect_to :action=>"index"
  end
  private

  def params_product
  	params.require(:product).permit  	
  end
end

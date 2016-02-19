class ProductsController < ApplicationController
	before_action :find_product, only: [:show,:edit,:update,:destroy]

	def index
		@product = Product.all.order("created_at DESC")
	end

	def show

	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to @product, notice: "Successfully created new recipe"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to @product
		else
			render 'edit'
		end
	end

	def destroy
		@product.destroy
		redirect_to root_path, notice: "Successfully deleted product"
	end


	private 

	def product_params
		params.require(:product).permit(:age, :gender, :breeds, :city, :price, :description, :image)
	end

	def find_product
		@product = Product.find(params[:id])
	end
end

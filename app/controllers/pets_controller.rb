class PetsController < ApplicationController


  def index
    @pets = Pet.paginate(page: params[:page])

  end

  def show
  	@pet = Pet.find(params[:id])

  end

  def new
  	@pet = Pet.new
  end

  def create
  	@pet = Pet.new(pet_params)    # Not the final implementation!
    if @pet.save
      flash[:success] = "Success to add a pet!"
      redirect_to @pet
    else
      render 'new'
    end
  end

   private

    def pet_params
      params.require(:pet).permit(:nickname, :age, :gender,
                                   :breeds)
    end
  	
end

class CommentsController < ApplicationController
def create
  @pet = Pet.find(params[:pet_id])
  @comment = @pet.comments.create(comment_params)
  @comment.user_id = current_user.id #or whatever is you session name
  if @comment.save
    redirect_to pet_path(@pet)
  else
    flash.now[:danger] = "error"
  end
end



private

    def comment_params
      params.require(:comment).permit(:body, :user_id, :pet_id)
    end

end

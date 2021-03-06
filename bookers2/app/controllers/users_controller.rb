class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  	    flash[:notice] = "You have created book successfully."
  		redirect_to book_path(@book.id)
  	else
  		@books = Book.all
  		render 'books/index'
  end
 end

def edit
	@user = User.find(params[:id])

end

def update

		@user = User.find(params[:id])
	  if @user.update(user_params)
		redirect_to user_path(@user.id)

	  else
	  	render 'users/edit'
	  end

end

def index
    
    
	@users = User.all
	@book = Book.new
end

def destroy

	@user.destroy
	flsh[:notice] = "Signed out successfully."
	redirect_to root_path
	
end


  private

def user_params
    params.require(:user).permit(:name, :profile_image, :introduction_id )
	
end
    

end

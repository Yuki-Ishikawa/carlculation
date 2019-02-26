class CarsController < ApplicationController
  def top
    @blogs = Blog.limit(3).reverse_order
    @notes = Note.limit(3).reverse_order
  end
  def new
    @car = Car.new
  end

  def create
  	@car = Car.new(car_params)
    @car.user_id = current_user.id
  	if
      @car.save
      redirect_to car_path(@car.id)
    else 
      puts @car.errors.full_messages
      # コンソール側にエラーメッセージを吐く記述
      render action: 'new'
    end
  end

  def show
  	@car = Car.find(params[:id])
  end

  def edit
  	@car = Car.find(params[:id])
  end

  def update
  	@car = Car.find(params[:id])
  	if
      @car.update(car_params)
      redirect_to car_path(@car.id)
    else
      puts @car.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    user = current_user.id
    car = Car.find(params[:id])
    car.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def car_params
  	params.require(:car).permit(:user_id, :maker, :car_model, :model_code, :body_type, :grade, :color, :introduction, :image)
  end

  def user_params
    params.require(:user).permit(:user_name, :blog_title, :profile_image, :user_address, :sex, :job, :interest, :favorite, :self_introduction, :email)
  end
end

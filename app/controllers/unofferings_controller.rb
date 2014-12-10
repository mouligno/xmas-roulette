class UnofferingsController < ApplicationController
  expose(:unoffering, attributes: :unoffering_params)
  expose(:unofferings) { Unoffering.all }
  expose(:users) { User.order(:first_name) }

  def create
    if unoffering.save
      redirect_to new_unoffering_path()
    else
      render :new
    end
  end

  def update
    if unoffering.save
      redirect_to(unoffering)
    else
      render :edit
    end
  end

  private
    def unoffering_params
      params.require(:unoffering).permit(:user_offering_id, :user_not_offering_to)
    end
end

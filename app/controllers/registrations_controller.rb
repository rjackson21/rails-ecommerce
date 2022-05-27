class RegistrationsController < Devise::RegistrationsController
  def create
    super

    Cart.create(user_id: current_user.id)
  end
end
class UsersController < ApplicationController

  def delete_avatar_attachment
    user = User.find(params[:id])
    user.avatar.purge
    redirect_to edit_user_registration_path
  end
end
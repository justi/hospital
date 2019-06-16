# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def delete_avatar_attachment
    user = User.find(params[:id])
    user.avatar.purge
    redirect_to edit_user_registration_path
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protected

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = '您沒有權限！'
      redirect_to root_path
    end
  end
end

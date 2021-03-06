class SettingsController < ApplicationController
  def index
    if current_user && current_user.is_admin?
      @settings = Setting.all

      render "index"
    else
      redirect_to root_url, :notice => "Only admins can update settings"
    end
  end

  def update
    if current_user && current_user.is_admin?
      if params["settings"].is_a?(Hash)
        params["settings"].each do |key, value|
          Setting[key] = value
        end
      end

      render "index"
    else
      redirect_to root_url, :notice => "Only admins can update settings"
    end
  end
end

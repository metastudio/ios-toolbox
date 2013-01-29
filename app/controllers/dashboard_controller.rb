class DashboardController < ApplicationController
  def show
    @categories = Category.by_name.includes(:projects)
  end
end

class DashboardController < ApplicationController
  def show
    @categories = Category.roots.by_name.includes(:projects)
  end
end

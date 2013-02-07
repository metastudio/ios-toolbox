class DashboardController < ApplicationController
  def show
    @categories = Category.with_projects.by_name.includes(:projects)
  end
end

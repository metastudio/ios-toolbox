class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @categories_for_select = Category.options_hash
  end

  def create
    @project = Project.in_review.create! params[:project]
    redirect_to root_path, notice: 'Thanks for your submission'
  end
end

class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @categories_for_select = Category.options_hash
  end

  def create
    @project = Project.in_review.create! params[:project]
    redirect_to root_path, notice: 'Thanks for your submission'
  end

  def by_tag
    @tag = Tag.find_by_name! params[:tag].to_s
    @projects = @tag.projects.by_rating
  end
end

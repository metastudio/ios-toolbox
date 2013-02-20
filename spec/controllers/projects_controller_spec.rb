require 'spec_helper'

describe ProjectsController do
  describe '#new' do
    before { get :new }

    describe '@project' do
      subject { assigns(:project) }

      it { should be_an_instance_of Project }
      it { should be_a_new_record }
    end

    describe '@categories_for_select' do
      subject { assigns(:categories_for_select) }

      it { should be_an_instance_of Array }
    end
  end

  describe '#create' do
    let(:category) { create :category }

    def create_project
      post :create, project: attributes_for(:project).merge(category_id: category.id)
    end

    it 'creates new project and places it for review' do
      expect { create_project }.to change(Project.in_review, :count).by(1)
    end

    it 'redirects user back to the dashboard' do
      create_project
      response.should redirect_to root_path
    end
  end
end

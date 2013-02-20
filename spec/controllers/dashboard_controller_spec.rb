require 'spec_helper'

describe DashboardController do
  describe '#show' do
    describe '@categories', brittle: true do
      let(:categories_with_projects) { stub('Categories with projects').as_null_object }

      it 'assigns categories' do
        Category.stub with_projects: categories_with_projects
        get :show
        assigns(:categories).should == categories_with_projects
      end
    end
  end
end

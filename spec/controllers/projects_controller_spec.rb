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
end

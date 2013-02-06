require 'spec_helper'

describe Project do
  it { should belong_to(:category) }

  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:name) }

  it { should     allow_mass_assignment_of(:name) }
  it { should     allow_mass_assignment_of(:url) }
  it { should     allow_mass_assignment_of(:category_id) }
  it { should_not allow_mass_assignment_of(:rating) }
  it { should_not allow_mass_assignment_of(:is_reviewed) }

  it { should     allow_value('/AndreyChernyh/rails').for(:github_path) }
  it { should_not allow_value('http://whatever.com/Andrey/rails').for(:github_path) }

  describe '.by_rating' do
    let(:rating10) { create :project, rating: 10 }
    let(:rating5)  { create :project, rating: 5  }
    let(:rating50) { create :project, rating: 50 }

    subject { described_class.by_rating }

    it { should == [rating50, rating10, rating5] }
  end

  describe '.in_review' do
    let(:published)   { create :project, is_reviewed: true }
    let(:unpublished) { create :project, is_reviewed: false }

    subject { described_class.in_review }

    it { should     include unpublished }
    it { should_not include published   }
  end

  describe '.published' do
    let(:published)   { create :project, is_reviewed: true }
    let(:unpublished) { create :project, is_reviewed: false }

    subject { described_class.published }

    it { should_not include unpublished }
    it { should     include published   }
  end
end

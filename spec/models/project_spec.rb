require 'spec_helper'

describe Project do
  it { should belong_to(:category) }

  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:name) }

  it { should     allow_mass_assignment_of(:name) }
  it { should     allow_mass_assignment_of(:url) }
  it { should_not allow_mass_assignment_of(:rating) }

  describe '.by_rating' do
    let(:rating10) { create :project, rating: 10 }
    let(:rating5)  { create :project, rating: 5  }
    let(:rating50) { create :project, rating: 50 }

    subject { described_class.by_rating }

    it { should == [rating50, rating10, rating5] }
  end
end

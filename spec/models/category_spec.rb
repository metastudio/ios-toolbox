require 'spec_helper'

describe Category do
  it { should have_many(:projects).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should allow_mass_assignment_of(:name) }

  describe '.with_projects' do
    let!(:category_with_projects)    { create :category }
    let!(:category_without_projects) { create :category }
    let!(:project)                   { create :project, category: category_with_projects }

    subject { described_class.with_projects }

    it { should     include(category_with_projects), 'It should include category with projects' }
    it { should_not include(category_without_projects), 'It should not include category with 0 projects' }
  end

  describe '.options_hash' do
    let!(:networking) { create :category, name: 'Networking' }
    let!(:graphics)   { create :category, name: 'Graphics' }

    subject { described_class.options_hash }

    it { should include ['Networking', networking.id] }
    it { should include ['Graphics', graphics.id] }
  end
end

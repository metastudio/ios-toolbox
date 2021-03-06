require 'spec_helper'

describe Project do
  it { should belong_to(:category) }
  it { should have_many(:projects_tags).dependent(:destroy) }
  it { should have_many(:tags).through(:projects_tags) }
  it { should have_many(:projects_apps).dependent(:destroy) }
  it { should have_many(:apps).through(:projects_apps) }

  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:name) }

  it { should     allow_mass_assignment_of(:name) }
  it { should     allow_mass_assignment_of(:url) }
  it { should     allow_mass_assignment_of(:category_id) }
  it { should_not allow_mass_assignment_of(:rating) }
  it { should_not allow_mass_assignment_of(:is_published) }

  it { should     allow_value('AndreyChernyh/rails').for(:github_path) }
  it { should_not allow_value('http://whatever.com/Andrey/rails').for(:github_path) }

  describe '.by_rating' do
    let(:rating10) { create :project, rating: 10 }
    let(:rating5)  { create :project, rating: 5  }
    let(:rating50) { create :project, rating: 50 }

    subject { described_class.by_rating }

    it { should eq([rating50, rating10, rating5]), 'It returns projects ordered by rating descending' }
  end

  describe '.in_review' do
    let(:published)   { create :project, is_published: true }
    let(:unpublished) { create :project, is_published: false }

    subject { described_class.in_review }

    it { should     include(unpublished), 'It should not include non-published project' }
    it { should_not include(published), 'It should include published project' }
  end

  describe '.published' do
    let(:published)   { create :project, is_published: true }
    let(:unpublished) { create :project, is_published: false }

    subject { described_class.published }

    it { should_not include(unpublished), 'It should not include non-published project' }
    it { should     include(published), 'It should include published project' }
  end

  describe '#github_url' do
    let(:project) { stub_model Project, github_path: github_path }
    subject { project.github_url }

    context 'with github_path' do
      let(:github_path) { 'rails/rails' }
      it { should == 'https://github.com/rails/rails'}
    end

    context 'without github_path' do
      let(:github_path) { nil }
      it { should be_nil }
    end
  end

  describe '#source_code_url' do
    let(:project) { stub_model Project }

    before do
      project.github_path = nil
      project.source_code_url = nil
    end

    subject { project.source_code_url }

    context 'with github_url' do
      before { project.stub github_url: 'http://github.com/AndreyChernyh/rails' }
      it { should == 'http://github.com/AndreyChernyh/rails' }
    end

    context 'with source_code_url' do
      before { project.source_code_url = 'http://sourceforge.org/whatever' }
      it { should == 'http://sourceforge.org/whatever' }
    end

    context 'without both' do
      it { should be_nil }
    end
  end
end

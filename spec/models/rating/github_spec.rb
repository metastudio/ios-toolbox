require 'spec_helper'

module Rating
  describe Github do
    let(:project) { stub_model Project, github_path: repo }

    describe '.fetch' do
      subject { described_class.new(project).fetch }

      context 'when github_repo is present' do
        let(:repo) { 'rails/rails' }
        it { VCR.use_cassette('github_repo') { should > 0 } }
      end

      context 'when github_repo is blank' do
        let(:repo) { nil }
        it { should == 0 }
      end
    end
  end
end

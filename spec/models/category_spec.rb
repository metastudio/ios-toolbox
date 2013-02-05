require 'spec_helper'

describe Category do
  it { should have_many(:projects).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should allow_mass_assignment_of(:name) }
end

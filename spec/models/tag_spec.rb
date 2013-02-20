require 'spec_helper'

describe Tag do
  it { should have_many(:projects) }  
  it { should have_many(:projects_tags).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end

require 'spec_helper'

describe App do
  it { should have_many(:projects_apps).dependent(:destroy) }
  it { should have_many(:projects).through(:projects_apps) }

  it { should validate_presence_of(:name) }
end

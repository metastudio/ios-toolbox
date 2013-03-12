require 'spec_helper'

describe ProjectsApp do
  it { should belong_to(:project) }
  it { should belong_to(:app) }

  it { should validate_presence_of(:project_id) }
  it { should validate_presence_of(:app_id) }
end

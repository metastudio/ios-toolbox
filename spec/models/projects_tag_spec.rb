require 'spec_helper'

describe ProjectsTag do
  it { should belong_to(:project) }
  it { should belong_to(:tag) }

  it { should validate_presence_of(:project_id) }
  it { should validate_presence_of(:tag_id) }
  it { create :projects_tag; should validate_uniqueness_of(:tag_id).scoped_to(:project_id) }
end

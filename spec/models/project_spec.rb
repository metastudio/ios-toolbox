require 'spec_helper'

describe Project do
  it { should belong_to(:category) }

  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:name) }
end

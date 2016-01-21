require 'rails_helper'

RSpec.describe Category, :type => :model do
    # Basic validations
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    # Associations
    it { should have_many(:items) }
end


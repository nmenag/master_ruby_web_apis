require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'validations' do
    it { should validate_presence_of(:given_name) }
    it { should validate_presence_of(:family_name) }
  end

  # An author should indeed have many books!
  context 'associations' do
    it { should have_many(:books) }
  end



  it 'has a valid factory' do
    expect(build(:author)).to be_valid
  end

end

# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Publisher, type: :model do

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

  context 'associations' do
    it { should have_many(:books) }
  end

  it 'has a valid factory' do
    expect(build(:publisher)).to be_valid
  end
end

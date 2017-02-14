# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  title        :string
#  subtitle     :text
#  isbn_10      :string
#  isbn_13      :string
#  description  :text
#  released_on  :date
#  publisher_id :integer
#  author_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cover        :string
#

require 'rails_helper'

RSpec.describe Book, type: :model do

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:released_on) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:isbn_10) }
    it { should validate_presence_of(:isbn_13) }
    it { should validate_length_of(:isbn_10).is_equal_to(10) }
    it { should validate_length_of(:isbn_13).is_equal_to(13) }
    it { should validate_uniqueness_of(:isbn_10) }
    it { should validate_uniqueness_of(:isbn_13) }
  end

  context 'associations' do
    it { should belong_to(:publisher) }
    it { should belong_to(:author) } 
  end

  it 'has a valid factory' do
    expect(build(:book)).to be_valid
  end
end

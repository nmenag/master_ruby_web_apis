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
# Indexes
#
#  index_books_on_author_id     (author_id)
#  index_books_on_publisher_id  (publisher_id)
#

require 'rails_helper'

RSpec.describe Book, type: :model do

  context 'db' do
    context 'columns' do
      it { should have_db_column(:title).of_type(:string).with_options(null: true) }
      it { should have_db_column(:subtitle).of_type(:text).with_options(null: true) }
      it { should have_db_column(:isbn_10).of_type(:string).with_options(null: true) }
      it { should have_db_column(:isbn_13).of_type(:string).with_options(null: true) }
      it { should have_db_column(:description).of_type(:text).with_options(null: true) }
      it { should have_db_column(:released_on).of_type(:date).with_options(null: true) }
    end

    context 'indexes' do
      it { should have_db_index(:author_id) }
      it { should have_db_index(:publisher_id) }
    end
  end

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

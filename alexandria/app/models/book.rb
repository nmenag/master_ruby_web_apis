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

class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :author

  validates :title, presence: true
  validates :released_on, presence: true
  validates :author, presence: true
  validates :isbn_10, presence: true, length: { is: 10 }, uniqueness: true
  validates :isbn_13, presence: true, length: { is: 13 }, uniqueness: true

  mount_base64_uploader :cover, CoverUploader
end

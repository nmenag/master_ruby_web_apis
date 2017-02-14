# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  given_name  :string
#  family_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Author < ApplicationRecord
  has_many :books
  validates :given_name, presence: true
  validates :family_name, presence: true
end

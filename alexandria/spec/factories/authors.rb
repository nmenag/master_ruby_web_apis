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

FactoryGirl.define do
  factory :author do
    given_name 'Pat'
    family_name 'Shaughnessy'
  end

  factory :michael_hartl, class: Author do
    given_name 'Michael'
    family_name 'Hartl'
  end

  factory :sam_ruby, class: Author do
    given_name 'Sam'
    family_name 'Ruby'
  end
end

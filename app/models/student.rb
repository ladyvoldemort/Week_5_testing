# == Schema Information
#
# Table name: students
#
#  id             :bigint(8)        not null, primary key
#  school_id      :bigint(8)
#  name           :string           not null
#  student_number :integer          default(0), not null
#  gpa            :float            default(0.0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Student < ApplicationRecord
  # Validations
  validates_presence_of :name, :student_number, :gpa
  validates_uniqueness_of :name
  validates :student_number, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000}

  # Associations
  belongs_to :school
end

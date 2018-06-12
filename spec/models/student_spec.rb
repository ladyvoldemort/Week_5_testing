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

require 'rails_helper'

RSpec.describe Student, type: :model do
  # write your student model here
    let(:student) { FactoryBot.create(:student) } #creates variable called student with stuff in factory

  describe 'attributes' do
    it 'has a name' do
      name = "Gilbert"
      student.name = name
      expect(student.name).to eq(name)
    end

    it 'has a student number' do
      number = 8888
      student.student_number = number
      expect(student.student_number).to eq(number)
      end

    it "has a gpa" do
      gpa = 3.7
      student.gpa = gpa
      expect(student.gpa).to eq(gpa)
    end
  end

  describe "association" do
    it { should belong_to(:school) }
  end

  describe "uniqueness" do
    subject { student }
      it { should validate_uniqueness_of(:name) }
  end

  describe "numericality" do
      it { should validate_numericality_of(:student_number) }
  end 

end 

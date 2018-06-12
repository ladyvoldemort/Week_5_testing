# == Schema Information
#
# Table name: schools
#
#  id             :bigint(8)        not null, primary key
#  name           :string           not null
#  address        :string           not null
#  principal      :string           not null
#  capacity       :integer          default(0), not null
#  private_school :boolean          default(TRUE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe School, type: :model do
  
  describe 'attributes' do
    it 'has a name' do
      name = 'BurgerU'
      school = School.create(name: name)
      expect(school.name).to eq(name)
    end

    it 'has a address' do
      address = '123 Street BLVD'
      school = School.create(address: address)
      expect(school.address).to eq(address)
    end

    it 'has a principal' do
      principal = 'Mr. T'
      school = School.create(principal: principal)
      expect(school.principal).to eq(principal)
    end

    it 'has a capacity' do
      capacity = 150
      school = School.create(capacity: capacity)
      expect(school.capacity).to eq(capacity)
    end

    it 'is a private school' do
      private_school = true
      school = School.create(private_school: private_school)
      expect(school.private_school).to eq(private_school)
    end

    it 'is not a private school' do
      private_school = false
      school = School.create(private_school: private_school)
      expect(school.private_school).to eq(private_school)
    end

    # it { should respond_to :name } 
  end
  
  describe "association" do
    it { should have_many(:students) }
    it { should have_many(:students).dependent(:destroy) }
  end

  describe "uniqueness" do
    School.create!(name: 'foo', address: '123', principal: 'mt')
    subject { School.new(name: 'foo', address: '123', principal: 'mt') }
    it { should validate_uniqueness_of(:name) }
  end

  describe "numericality" do
    before(:each) do
      @school = School.create(name: 'foo', address: '123', principal: 'mt', capacity: 15)
    end
    
     it { should validate_numericality_of(:capacity) }
  end 
end

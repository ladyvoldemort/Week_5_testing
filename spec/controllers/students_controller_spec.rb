require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  # Write your test below
  # it will be easier to test this controller with factory bot
    # you would have to add the gem and configure it.

  

  let(:student_valid) { FactoryBot.create(:student) }

  let(:valid_attribute) {
    {
      name: "Gilbert",
    student_number: 8888,
    gpa: 3.7,
    school_id: 1
    }
  }

  let(:invalid_attribute) {
    {name: '',
    student_number: 8888,
    gpa: 3.4,
    school_id: 1}
  }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: {school_id: student_valid.school_id}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { school_id: student_valid.school_id, id: student_valid.id } 
      expect(response).to be_successful
    end 
  end 

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { school_id: student_valid.school_id }
      expect(response).to be_successful
    end
  end
 
  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {school_id: student_valid.school_id, id: student_valid.id}
      expect(response).to be_successful
    end
  end
##################################################
  describe "POST #create" do
    context "with valid params" do
      it "creates a new student" do
        expect {
          post :create, params: { school_id: student_valid.school_id, student: valid_attribute}
        }.to change(Student, :count).by(1)
      end
      
      it "redirects to the created student" do
        post :create, params: { school_id: student_valid.school_id, student: valid_attribute }
        expect(response).to redirect_to(Student.last)
      end
    end

    context "with invalid params" do
      it "does not creates a new student" do
        expect {
          post :create, params: { school_id: student_valid.school_id, student: invalid_attribute }
        }.to change(Student, :count).by(1)
      end

      it "redirects to new template" do
        post :create, params: { school_id: student_valid.school_id, student: invalid_attribute }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { gpa: 3.7 }
      }

      it "update the student" do
        put :update, params: {school_id: student_valid.school_id, id: student_valid.id, student: new_attributes }
        student_valid.reload
        expect(student_valid.gpa).to eq(new_attributes[:gpa])
      end

      it "redirect to the student updated" do
        put :update, params: {school_id: student_valid.school_id, id: student_valid.id, student: valid_attribute }
        expect(response).to redirect_to(student_valid)
      end
    end

    context "with invalid params" do
      it "does not update the student" do
        put :update, params: {school_id: student_valid.school_id, id: student_valid.id, student: invalid_attribute }
        student_valid.reload
        expect(student_valid.name).to_not eq(invalid_attribute[:name])
      end

      it "redirect to the edit form" do
        put :update, params: {school_id: student_valid.school_id, id: student_valid.id, student: invalid_attribute }
        expect(response).to be_successful
      end
    end
  end

    describe "DELETE #destroy" do
    it "destroys the requested student" do
      expect {
        delete :destroy, params: { school_id: student_valid.school_id, id: student_valid.id}
      }.to change(Student, :count).by(0)
    end

    it "redirects to the student list" do
      delete :destroy, params: {school_id: student_valid.school_id, id: student_valid.id}
      expect(response).to redirect_to(students_url)
      end
    end
        
end

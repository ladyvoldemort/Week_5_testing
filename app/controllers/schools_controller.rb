class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]



  # GET /schools
  def index
    @schools = School.all
  end

  # GET /schools/1
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # POST /schools
  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school, notice: 'School is created'
    else
      render :new
    end
  end
  
  # GET /schools/edit
  def edit
  end
  #PATCH
  def update
    if @school.update(school_params)
      redirect_to @school, notice: 'School is Updated'
    else
      render :edit
    end
  end

  # DELETE /schools
  def destroy
    @school.destroy
    redirect_to schools_path
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :address, :capacity, :principal, :private_school)
  end
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.

end

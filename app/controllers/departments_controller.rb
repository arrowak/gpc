class DepartmentsController < ApplicationController
  # GET /departments
  # GET /departments.json
  def index
    @institute = Institute.find(params[:institute_id])
    @departments = @institute.departments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departments }
    end
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department }
    end
  end

  # GET /departments/new
  # GET /departments/new.json
  def new
    @institute = Institute.find(params[:institute_id])
    @department = Department.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.json
  def create
    @institute = Institute.find(params[:institute_id])
    @department = Department.new(params[:department])

    @department.institute = @institute

    respond_to do |format|
      if @department.save
        format.html { redirect_to institute_department_path(@institute, @department), notice: 'Department was successfully created.' }
        format.json { render json: @department, status: :created, location: @department }
      else
        format.html { render action: "new" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.json
  def update
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:id])

    @department.institute = @institute

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to institute_department_path(@institute, @department), notice: 'Department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @institute = Institute.find(params[:institute_id])
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to institute_departments_path(@institute) }
      format.json { head :no_content }
    end
  end
end

class AnnouncementsController < ApplicationController
  # GET /announcements
  # GET /announcements.json
  def index
    @batch = Batch.find(params[:batch_id])
    @announcements = Announcement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @batch = Batch.find(params[:batch_id])
    @announcement = Announcement.find(params[:id])
    @assets = @announcement.assets
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /announcements/new
  # GET /announcements/new.json
  def new
    @batch = Batch.find(params[:batch_id])
    @announcement = Announcement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /announcements/1/edit
  def edit
    @batch = Batch.find(params[:batch_id])
    @announcement = Announcement.find(params[:id])
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @batch = Batch.find(params[:batch_id])
    @announcement = Announcement.create(params[:announcement])

    @announcement.batch = @batch
    @announcement.user = current_user

    respond_to do |format|
      if @announcement.save
        @announcement.create_activity :create, :owner => current_user

        format.html { redirect_to batch_announcement_path(@batch, @announcement), notice: 'Announcement was successfully created.' }
        format.json { render json: @announcement, status: :created, location: @announcement }
      else
        format.html { render action: "new" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /announcements/1
  # PUT /announcements/1.json
  def update
    @batch = Batch.find(params[:batch_id])
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      if @announcement.update_attributes(params[:announcement])
        @announcement.create_activity :update, :owner => current_user
        format.html { redirect_to batch_announcement_path(@batch, @announcement), notice: 'Announcement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @batch = Batch.find(params[:batch_id])
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to batch_announcements_path(@batch) }
      format.json { head :no_content }
    end
  end
end

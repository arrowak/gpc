class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index
    @batch = Batch.find(params[:batch_id])
    @documents = @batch.documents
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @batch = Batch.find(params[:batch_id])
    @document = Document.find(params[:id])
    @assets = @document.assets

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @batch = Batch.find(params[:batch_id])
    @document = Document.new
    respond_to do |format|
      #format.js
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @batch = Batch.find(params[:batch_id])
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @batch = Batch.find(params[:batch_id])
    @document = Document.create(params[:document])
    @document.batch = @batch
    @document.user = current_user

    respond_to do |format|
      if @document.save
        @document.create_activity :create, :owner => current_user
        format.html { redirect_to batch_document_path(@batch, @document), notice: 'Document was successfully created.' }
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @batch = Batch.find(params[:batch_id])
    @document = Document.find(params[:id])

    @document.batch = @batch
    @document.user = current_user
    
    respond_to do |format|
      if @document.update_attributes(params[:document])
        @document.create_activity :update, :owner => current_user

        format.html { redirect_to batch_document_path(@batch, @document), notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @batch = Batch.find(params[:batch_id])
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to batch_documents_path(@batch) }
      format.json { head :no_content }
    end
  end

end

class RepairRequestsController < ApplicationController
  load_and_authorize_resource
  
  # GET /repair_requests
  # GET /repair_requests.json
  def index
    if current_user && current_user.has_role?(:manager)
      @repair_requests = RepairRequest.all
    else
      @repair_requests = RepairRequest.where("submitter_id = ?", current_user.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @repair_requests }
    end
  end

  # GET /repair_requests/1
  # GET /repair_requests/1.json
  def show
    #@repair_request = RepairRequest.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @repair_request }
    end
  end

  # GET /repair_requests/new
  # GET /repair_requests/new.json
  def new
    #@repair_request = RepairRequest.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @repair_request }
    end
  end

  # GET /repair_requests/1/edit
  def edit
    #@repair_request = RepairRequest.find(params[:id])
  end

  # POST /repair_requests
  # POST /repair_requests.json
  def create
    #@repair_request = RepairRequest.new(params[:repair_request])
    
    if current_user
      @repair_request.submitter_id ||= current_user.id
    end
    
    respond_to do |format|
      if @repair_request.save
        format.html { redirect_to @repair_request, notice: 'Repair request was successfully created.' }
        format.json { render json: @repair_request, status: :created, location: @repair_request }
      else
        format.html { render action: "new" }
        format.json { render json: @repair_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /repair_requests/1
  # PUT /repair_requests/1.json
  def update
    #@repair_request = RepairRequest.find(params[:id])
    
    if current_user
      if current_user.has_role?(:manager)
        @repair_request.responder_id ||= current_user.id
      else
        @repair_request.submitter_id ||= current_user.id
      end
    end
    
    respond_to do |format|
      if @repair_request.update_attributes(params[:repair_request])
        format.html { redirect_to @repair_request, notice: 'Repair request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @repair_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_requests/1
  # DELETE /repair_requests/1.json
  def destroy
    #@repair_request = RepairRequest.find(params[:id])
    @repair_request.destroy

    respond_to do |format|
      format.html { redirect_to repair_requests_url }
      format.json { head :no_content }
    end
  end
end

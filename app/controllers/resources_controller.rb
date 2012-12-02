  class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  before_filter :authorize, :except => [:index, :show]

  def index
    if params[:subject_search]
      @resources = Resource.subject_search(params[:subject_search])
    elsif params[:search]
      @resources = Resource.search(params[:search])
    elsif params[:all_active]
      @resources = Resource.all_active
      skip_count = 1 # don't show record count for generic display
    else
      @resources = Resource.popular_resources
      skip_count = 1
    end
    
    @terms = Term.all_iit_subjects

    if skip_count != 1
      flash[:notice] =  @resources.count.to_s + " record(s) found."
    else
      flash[:notice] ="" # there must be a more elegant solution than this
    end

  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
    @iit_terms = Term.all_iit_subjects
    @non_iit_terms = Term.all_iit_non_subjects
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(params[:resource])

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    params[:resource][:term_ids] || []
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end
end

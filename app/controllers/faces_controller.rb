class FacesController < ApplicationController
  parent_resource :character
  before_filter :authenticate_user!

  # GET /faces
  # GET /faces.xml
  def index
    @faces = @character.faces

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @faces }
    end
  end

  # GET /faces/1
  # GET /faces/1.xml
  def show
    @face = @character.faces.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @face }
    end
  end

  # GET /faces/new
  # GET /faces/new.xml
  def new
    @face = @character.faces.new

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @face }
    end
  end

  # GET /faces/1/edit
  def edit
    @face = @character.faces.find(params[:id])
  end

  # POST /faces
  # POST /faces.xml
  def create
    @face = Face.new(params[:face])
    @face.character = @character
    @face.user = current_user

    respond_to do |format|
      if @face.save
        format.html { redirect_to([@character, @face], :notice => 'Face was successfully created.') }
        format.xml  { render :xml => @face, :status => :created, :location => @face }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @face.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /faces/1
  # PUT /faces/1.xml
  def update
    @face = @character.faces.find(params[:id])
    respond_to do |format|
      if @face.update_attributes(params[:face])
        format.html { redirect_to([@character, @face], :notice => 'Face was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @face.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /faces/1
  # DELETE /faces/1.xml
  def destroy
    @face = @character.faces.find(params[:id])
    @face.destroy

    respond_to do |format|
      format.html { redirect_to([@character, :faces]) }
      format.xml  { head :ok }
    end
  end
end

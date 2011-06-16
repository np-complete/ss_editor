class DialogsController < ApplicationController
  parent_resources :story

  # GET /dialogs
  # GET /dialogs.xml
  def index
    @dialogs = @story.dialogs
    @dialog = @story.dialogs.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dialogs }
    end
  end

  def update_orders
    Dialog.transaction do
      if @story.update_dialog_orders!(params[:dialogs].map(&:to_i))
        render :text => 'ok'
      else
        render :text => 'ng'
      end
    end
  rescue
    render :text => 'ng'
  end

  # GET /dialogs/1
  # GET /dialogs/1.xml
  def show
    @dialog = @story.dialogs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dialog }
    end
  end

  # GET /dialogs/new
  # GET /dialogs/new.xml
  def new
    @dialog = @story.dialogs.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dialog }
    end
  end

  # GET /dialogs/1/edit
  def edit
    @dialog = @story.dialogs.find(params[:id])
  end

  # POST /dialogs
  # POST /dialogs.xml
  def create
    @dialog = @story.dialogs.new(params[:dialog])

    respond_to do |format|
      if @dialog.save
        format.html { redirect_to([@story, :dialogs], :notice => 'Dialog was successfully created.') }
        format.xml  { render :xml => @dialog, :status => :created, :location => @dialog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dialog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dialogs/1
  # PUT /dialogs/1.xml
  def update
    @dialog = @story.dialogs.find(params[:id])

    respond_to do |format|
      if @dialog.update_attributes(params[:dialog])
        format.html { redirect_to([@story, :dialogs], :notice => 'Dialog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dialog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dialogs/1
  # DELETE /dialogs/1.xml
  def destroy
    @dialog = @story.dialogs.find(params[:id])
    @dialog.destroy

    respond_to do |format|
      format.html { redirect_to([@story, :dialogs]) }
      format.xml  { head :ok }
    end
  end

  def change_faces
    @faces = params[:character_id].present? ?  @faces = Character.find(params[:character_id]).faces : []

    render :update do |page|
      page.replace_html :dialog_face_id, options_for_select(@faces.map{|x| [x.name, x.id]})
    end
  end
end

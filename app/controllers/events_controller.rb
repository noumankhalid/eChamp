class EventsController < ApplicationController
  # GET /events
  # GET /events.json

  helper :all  
  before_filter :authenticate_user!, :except => ["index","show","fetch_pages","get_ticket","ticket","search"]
  before_filter :check_profile
  before_filter :check_permissions, :only => [:edit,:new, :create,:destroy]
  
  def check_profile
    unless params[:controller] == "profiles" && params[:action] == "new"
      if current_user && current_user.profile.blank?
        flash[:notice] = "Please Create your profile first!"
        redirect_to :controller => "profiles", :action => "new"
      end
    end
  end

  def index
    if is_admin?
      @events = Event.all
    else
      @events = Event.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    unless @event.blank?
      @qr = RQRCode::QRCode.new( "#{@event.id}", :size => 2, :level => :h )
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    params[:event][:user_id] = current_user.id;
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end

  def fetch_pages
    if params[:id] == "all" || params[:id].blank?      
      @events = Event.all
    else      
      @events = Event.where("LOWER(name) LIKE ?", "#{params[:id].downcase}%").order("name")
    end
    render :partial => "list", :layout => false
  end

  def get_ticket
    @event = Event.find(params[:id])
    #    @qr = RQRCode::QRCode.new( "#{@order.number}", :size => 2, :level => :h )
    render :layout => false
  end

  def ticket
    @event = Event.find(params[:id])
    @qr = RQRCode::QRCode.new( "#{@event.id}", :size => 2, :level => :h )
    render :layout => false
  end

  def search
    @events = Event.where("LOWER(name) LIKE ?", "%#{params[:q].downcase}%").order("name")
  end

end
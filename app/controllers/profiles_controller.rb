class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.json

  before_filter :authenticate_user!

  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html
#      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = current_user.profile

    respond_to do |format|
      format.html # show.html.erb
#      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
#      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
#    @profile = Profile.find(params[:id])
    @profile = current_user.profile
  end

  # POST /profiles
  # POST /profiles.json
  def create
    params[:profile][:user_id] = current_user.id
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :ok }
    end
  end
end

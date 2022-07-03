class User::MeetupsController < ApplicationController
    before_action :set_group, only: %i[ show edit update destroy ]

  # GET /meetups or /meetups.json
  def index
    @meetups = Meetup.all
  end

  # GET /meetups/1 or /meetups/1.json
  def show
  end

  # GET /meetups/new
  def new
    @meetup = Meetup.new
  end

  # GET /meetups/1/edit
  def edit
  end

  # POST /meetups or /meetups.json
  def create
    @meetup = Meetup.new(group_params)
    respond_to do |format|
      if @meetup.save
        format.html { redirect_to meetup_url(@meetup), notice: "Meetup was successfully created." }
        format.json { render :show, status: :created, location: @meetup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetups/1 or /meetups/1.json
  def update
    respond_to do |format|
      if @meetup.update(meetup_params)
        format.html { redirect_to meetup_url(@meetup), notice: "Meetup was successfully updated." }
        format.json { render :show, status: :ok, location: @meetup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetups/1 or /meetups/1.json
  def destroy
    @meetup.destroy
    respond_to do |format|
      format.html { redirect_to meetups_url, notice: "Meetup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup
      @meetup = Meetup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meetup_params
      params.require(:meetup).permit(:title, :location, :user, :group)
    end
end

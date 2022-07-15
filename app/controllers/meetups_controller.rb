class MeetupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
    before_action :set_meetup, only: %i[ show edit update destroy ]

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
    @user_id = params[:user_id]
  end

  # GET /meetups/1/edit
  def edit
  end

  # POST /meetups or /meetups.json
  def create
      @meetup = Meetup.new(meetup_params)
      if @meetup.save
        flash.notice = "The meetup record was created successfully."
        redirect_to @meetup
      else
        flash.now.alert = @meetup.errors.full_messages.to_sentence
        render :new  
      end
  end

  # PATCH/PUT /meetups/1 or /meetups/1.json
 def update
    if @meetup.update(meetup_params)
      flash.notice = "The meetup record was updated successfully."
      redirect_to @meetup
    else
      flash.now.alert = @meetup.errors.full_messages.to_sentence
      render :edit
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
      params.require(:meetup).permit(:title, :location, :group_id, :date, :time)
    end

     #Setting up the meetup for the user
    def meetup
      if @user.group_id.present?
        @meetup = Meetup.create(meetup_id: @user.meetup_id, user_id: @user.id)
      end
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to meetups_path
    end
end

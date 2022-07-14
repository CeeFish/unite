class MembershipsController < ApplicationController

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    if(@membership.save)
        flash.notice = "The meetup record was created successfully."
        redirect_to @meetup
    else
        flash.now.alert = @meetup.errors.full_messages.to_sentence
        render :new  
    end
   end

  def delete
    @membership = Membership.find_by(mem_params)
    @membership.destroy
    flash[:notice] = "Your membership has been DESTROYED"
    redirect_to board_path(mem_params[:board_id])
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :board_id, :admin)
  end

end

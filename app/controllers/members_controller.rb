class MembersController < ApplicationController

  def read
  end

  def update
    flash[:notice] = 'Member was successfully updated.'
    redirect_to admin_members_path
  end

  def destroy
  end

  private

  def user_params
    params.require(:member).permit(:building)
  end

end

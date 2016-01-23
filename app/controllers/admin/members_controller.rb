class Admin::MembersController < ApplicationController

  #index provides an alphabetized list of all members
  def index
    redirect_non_admin
    @members = Member.all
  end
end

private

def redirect_non_admin
  redirect_to root_path unless current_user.role == 1
end

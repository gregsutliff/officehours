class Admin::MembersController < ApplicationController

  #index provides an alphabetized list of all members
  def index
    redirect_non_admin
    @members = Member.includes(:department, :building, :office).order('departments.name').order('members.lastname')
  end
end

private

def redirect_non_admin
  redirect_to root_path unless current_user.role == 1
end

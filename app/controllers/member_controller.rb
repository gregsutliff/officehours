class MemberController < ApplicationController
  def create
  end

	def edit
	end

  def read
  end

  def update
		flash[:notice] = "Member was successfully updated."
		redirect_to curate_path
  end

  def destroy
  end
end

class MemberController < ApplicationController
  def create
  end

	def edit
		@current_member = Member.find(user_params)
	end

  def read
  end

  def update
		flash[:notice] = "Member was successfully updated."
		redirect_to curate_path
  end

  def destroy
  end

	private

	def user_params
		params.require(:member_id)
	end
end

module AuthHelpers

	def log_in_user
		user = FactoryGirl.create(:user, :role => 3)
		fill_login_form(user)
	end

	def log_in_admin
		user = FactoryGirl.create(:user, :role => 1)
		fill_login_form(user)
	end

	def log_in_curator
		user = create(:user, :role => 2)
		fill_login_form(user)
	end

	private

	def fill_login_form(user)
		visit root_path
		fill_in "Email", :with => user.email
		fill_in "Password", :with => user.password
		click_button "Log in"
	end
end

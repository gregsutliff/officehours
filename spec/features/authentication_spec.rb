describe "User Sign In" do
	context "when the user is an admin" do
		it "the user is logged in and taken to the office hour index" do
			user = FactoryGirl.create(:user, :role => 1)
			visit root_path
			fill_in "Email", :with => user.email
			fill_in "Password", :with => user.password
			click_button "Log in"
			expect(current_path).to eq root_path
			expect(page).to have_content("Open Office Hours")
		end
	end

	context "when the user is an organizer" do
		it "the user is logged in and is taken to the office hour index" do
			user = FactoryGirl.create(:user, :role => 3)
			visit root_path
			fill_in "Email", :with => user.email
			fill_in "Password", :with => user.password
			click_button "Log in"
			expect(current_path).to eq root_path
			expect(page).to have_content("Open Office Hours")
		end
	end

	context "when the user is a curator" do
		it "the user is logged in and taken to the curation dashboard" do
			user = FactoryGirl.create(:user, :role => 2)
			visit root_path
			fill_in "Email", :with => user.email
			fill_in "Password", :with => user.password
			click_button "Log in"
			expect(current_path).to eq curate_path
			expect(page).to have_content("Department Dashboard")
		end
	end
end

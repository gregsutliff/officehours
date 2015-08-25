describe "User Authentication" do
	context "User is Admin" do
		it "Authenticates and redirects to Office Hour index" do
			user = FactoryGirl.create(:user, :role => 1)
			visit root_path
			fill_in "Email", :with => user.email
			fill_in "Password", :with => user.password
			click_button "Log in"
			expect(current_path).to eq root_path
			expect(page).to have_content("Open Office Hours")
		end
	end

	context "User is organizer" do
		it "Authenticates and redirects to Office Hour index" do
			user = FactoryGirl.create(:user, :role => 3)
			visit root_path
			fill_in "Email", :with => user.email
			fill_in "Password", :with => user.password
			click_button "Log in"
			expect(current_path).to eq root_path
			expect(page).to have_content("Open Office Hours")
		end
	end

	context "User is curator" do
		it "Authenticates and redirects to Curation page" do
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

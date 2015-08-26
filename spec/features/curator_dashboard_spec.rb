describe "Curator Dashboard" do
	it "is only accessible to department curators" do
		user = FactoryGirl.create(:user, :role => 3)
		visit root_path
		fill_in "Email", :with => user.email
		fill_in "Password", :with => user.password
		click_button "Log in"
		visit curate_path
		expect(current_path).to eq root_path
		expect(page).to have_content("You can't go there")
	end
	it "displays the page for the curator's department" do
		user = FactoryGirl.create(:user, :role => 2)
		visit root_path
		fill_in "Email", :with => user.email
		fill_in "Password", :with => user.password
		click_button "Log in"
		visit curate_path
		expect(page).to have_content("Mathematics Department Dashboard")
	end
end

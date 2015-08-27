
describe "Curator Member Editing" do
	let!(:user){FactoryGirl.create(:user, :role => 2)}
	let!(:member){FactoryGirl.create(:member, :department => user.department)}
	before(:each) do
		visit root_path
		fill_in "Email", :with => user.email
		fill_in "Password", :with => user.password
		click_button "Log in"
	end

	it "should be on the dashboard page" do
		expect(page).to have_content("Edit Member")
	end

	it "is possible to open a member edit window" do
		click_link "Edit Member"
		expect(page).to have_content "Save"
	end
end


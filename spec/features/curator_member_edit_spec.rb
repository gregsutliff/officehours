
describe "The member edit page" do
	before(:each) do
		user = log_in_curator
		member = create(:member_with_office, :department => user.department)
		create(:building, :fullname => "University Hall")
		visit current_path
	end

	it "allows you to update a member's building" do
		click_link "Edit Member"
		select "University Hall", :from => "member[building]"
		click_button "Update Member"
		expect(current_path).to eq curate_path
		expect(page).to have_content("Member was successfully updated.")
	end

end


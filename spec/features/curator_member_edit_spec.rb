
describe "The member edit page" do
	let!(:user){FactoryGirl.create(:user, :role => 2)}
	let!(:building){FactoryGirl.create(:building, :fullname => "University Hall")}
	let!(:member){FactoryGirl.create(:member_with_office, :department => user.department)}
	before(:each) do
		visit root_path
		fill_in "Email", :with => user.email
		fill_in "Password", :with => user.password
		click_button "Log in"
	end


	it "allows you to update a member's building" do
		click_link "Edit Member"
		expect(page).to have_content "Save"
		expect(page).to have_content "Greg"
		select "University Hall", :from => "member[building]"
		click_button "Update Member"
		expect(current_path).to eq curate_path
		expect(page).to have_content("Member was successfully updated.")
	end

end


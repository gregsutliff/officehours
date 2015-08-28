
describe "The Office Hour Index Page" do
	let!(:member){FactoryGirl.create(:member_with_office_hour)}
	let!(:user){FactoryGirl.create(:user)}
	before(:each) do
		log_in_user
	end

	it "displays current office hours" do
		expect(page).to have_content("Greg")
	end

end

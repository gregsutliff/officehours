describe "Curator Dashboard" do
	context "When the user is not a curator" do
		let(:user){FactoryGirl.create(:user, :role => 3)}
		it "the user is redirect to the root path" do
			visit root_path
			fill_in "Email", :with => user.email
			fill_in "Password", :with => user.password
			click_button "Log in"
			visit curate_path
			expect(current_path).to eq root_path
			expect(page).to have_content("You can't go there")
		end
	end

	context "When the user is a curator" do
		let!(:user){FactoryGirl.create(:user, :role => 2)}
		let!(:greg){FactoryGirl.create(:member, :department => user.department)}
		before(:each) do
			visit root_path
			fill_in "Email", :with => user.email
			fill_in "Password", :with => user.password
			click_button "Log in"
			visit curate_path
		end
		it "displays the page for the curator's department" do
			expect(page).to have_content("Mathematics Department Dashboard")
		end
		it "contains members of the curator's department" do
			expect(page).to have_content("Greg")
		end
	end



end

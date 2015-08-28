describe "Curator Dashboard" do
	context "When the user is not a curator" do
		it "the user is redirect to the root path" do
			log_in_user
			visit curate_path
			expect(current_path).to eq root_path
			expect(page).to have_content("You can't go there")
		end
	end

	context "When the user is a curator" do
		before(:each) do
			user = log_in_curator
			greg = create(:member_with_office, :department => user.department)
			visit current_path
		end
		it "displays the page for the curator's department" do
			expect(page).to have_content("Mathematics Department Dashboard")
		end
		it "contains members of the curator's department" do
			expect(page).to have_content("Greg")
		end
	end



end

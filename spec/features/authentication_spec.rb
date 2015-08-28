describe "User Sign In" do
	context "when the user is an admin" do
		it "the user is logged in and taken to the office hour index" do
			log_in_admin
			expect(current_path).to eq root_path
			expect(page).to have_content("Open Office Hours")
		end
	end

	context "when the user is an organizer" do
		it "the user is logged in and is taken to the office hour index" do
			log_in_user
			expect(current_path).to eq root_path
			expect(page).to have_content("Open Office Hours")
		end
	end

	context "when the user is a curator" do
		it "the user is logged in and taken to the curation dashboard" do
			log_in_curator
			expect(current_path).to eq curate_path
			expect(page).to have_content("Department Dashboard")
		end
	end
end

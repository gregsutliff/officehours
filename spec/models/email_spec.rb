require 'rails_helper'

RSpec.describe Email, type: :model do
	it "Has a valid factory" do 
		email = build(:email)
		expect(email).to be_valid
	end

	describe "#uic_email" do
		it "makes sure uic email is valid email" do
			email = build(:email, :uic_email => "john.net")
			expect(email).to_not be_valid
		end

		it "makes sure that uic_emails end with uic.edu" do
			email = build(:email, :uic_email => "john@ithaca.edu")
			expect(email).to_not be_valid
		end
	end

	describe "#non_uic_email" do
		it "must not contain uic.edu" do
			email = build(:email, :non_uic_email => "greg@uic.edu")
			expect(email).to_not be_valid
		end
		it "can be any other valid email" do
			email = build(:email, :non_uic_email => "greg@gregsutliff.com")
		end
		it "should reject invalid emails" do
			email = build(:email, :non_uic_email => "greg.net")
			expect(email).to_not be_valid
		end
	end
end

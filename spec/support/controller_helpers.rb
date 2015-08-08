module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end

  def login_curator
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      curator  = FactoryGirl.create(:user, :role => 2)
      sign_in curator
    end
  end
end

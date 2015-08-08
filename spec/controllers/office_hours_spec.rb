require 'support/controller_helpers'
require 'rails_helper'

RSpec.describe OfficeHoursController, type: :controller  do
  describe 'GET #index' do
    context 'when user is organizer' do
      login_user
      before(:each){ get :index }

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :index }
    end

    context 'when user is department curator' do
      login_curator
      before(:each){get :index }
      it { is_expected.to redirect_to(curate_url) }

      it "sets a flash message notifying them that they can't view that" do
        sign_in FactoryGirl.create(:user, :role => 2)
        get :index
        expect(flash[:notice]).to be_present 
      end
    end


    context 'when user is admin' do
      it 'renders active office hour index' do
        sign_in FactoryGirl.create(:user, :role => 1)
        get :index
      end
    end

    context 'when user is not logged in' do
    end
  end
end
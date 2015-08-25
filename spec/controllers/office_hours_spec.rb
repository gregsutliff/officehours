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
      before(:each) do
        get :index 
      end

      it { is_expected.to redirect_to(curate_url) }
    end
    context 'when user is not logged in' do
      before(:each) do
        get :index
      end

      it { is_expected.to redirect_to(new_user_session_url) }
    end
  end
end

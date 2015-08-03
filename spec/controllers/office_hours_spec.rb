describe 'GET #all' do

  context 'when user is logged in as organizer' do
    it 'renders active office hour index' do
    end
  end

  context 'when user is not logged in' do
    it 'redirects them to sign-in page' do
    end
  end

  context 'when user is logged in as department curator' do
    it 'redirects them to the curation page' do
    end

    it "sets a flash message notifying them that they can't view that" do
    end
  end


  context 'when user is logged in as admin' do
    it 'renders active office hour index' do
    end
  end

end

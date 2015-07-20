describe Api::V1::SessionsController do

  let(:user) { FactoryGirl.create :user }

  describe '#create' do

    context 'when password is correct' do
      before(:each) do
        post! "#{public_url}/login", { api_user: { email: user.email, password: user.password } }, headers
      end
      it 'logins user' do
        expect(json[:user][:email]).to                eq user.email
        expect(json[:user][:authentication_token]).to eq user.authentication_token
      end
      it { expect(response).to have_http_status(201) }
    end

    context 'when password is incorrect' do
      before(:each) do
        post! "#{public_url}/login", { api_user: { email: user.email, password: 'wrong!' } }, headers
      end
      it 'responds with error' do
        expect(json[:error]).to be_truthy
      end
      it { expect(response).to have_http_status(401) }
    end

  end

end

RSpec.describe Api::V1::RegistrationsController do

  describe '#create' do

    let(:user_params) { FactoryGirl.attributes_for :user }

    context 'when signin up' do
      it 'raises error' do
        expect {
          post! "#{public_url}/signup", { api_user: user_params }, headers
        }.to raise_error ActionController::RoutingError
      end
    end
  end

end

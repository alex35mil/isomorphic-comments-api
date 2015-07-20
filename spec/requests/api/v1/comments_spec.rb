RSpec.describe Api::V1::CommentsController do

  let(:user)      { FactoryGirl.create :user }
  let(:base_url)  { public_url '/comments' }


  describe 'GET #index' do

    let(:url) { base_url }

    before(:all) { FactoryGirl.create_list :comment, 10 }
    before(:each) { get! url, headers }

    it 'lists all comments' do
      expect(json[:comments].length).to eq 10
    end
    it { expect(response).to have_http_status(200) }

  end


  describe 'POST #create' do

    let(:url) { base_url }
    let(:comment_params) { FactoryGirl.attributes_for :comment }

    context 'when comment params are invalid' do
      before(:each) { post! url, { comment: {nothing: :here} }, headers }
      it 'responds with errors' do
        expect(json[:errors]).to be_truthy
      end
      it { expect(response).to have_http_status(422) }
    end

    context 'when comment params are valid' do
      before(:each) { post! url, { comment: comment_params }, headers }

      it 'creates comment and responds with it' do
        expect(json[:comment][:author]).to eq comment_params[:author]
        expect(json[:comment][:comment]).to eq comment_params[:comment]
      end

      it { expect(response).to have_http_status(201) }
    end
  end


  describe 'GET #show' do

    let(:comment) { FactoryGirl.create :comment }
    let(:url) { "#{base_url}/#{comment.id}" }

    before(:each) { get! url, headers }

    it 'responds with comment and title' do
      expect(json[:comment][:author]).to eq comment.author
      expect(json[:comment][:comment]).to eq comment.comment
    end

    it { expect(response).to have_http_status(200) }

  end


  describe 'DELETE #destroy' do

    let(:comment) { FactoryGirl.create :comment }
    let(:url) { "#{base_url}/#{comment.id}" }

    it_behaves_like 'unauthorized DELETE request'

    context 'when authorized' do
      before(:each) { delete! url, auth_headers(user) }
      it { expect(response).to have_http_status(204) }
    end

  end

end

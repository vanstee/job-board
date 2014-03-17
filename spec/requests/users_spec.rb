require 'spec_helper'

describe 'User accounts' do
  describe 'creating an account' do
    let(:email) { Forgery::Internet.email_address }
    let(:password) { Forgery::Basic.password }

    def create_user
      post '/users',
        user: {
          email: email,
          password: password,
          password_confirmation: password
        }
    end

    it 'creates a user and responds with it' do
      expect {
        create_user
      }.to change { User.count }.by(1)
      expect(response.body).to be_json_eql(%'{"user": {"email": "#{ email }"}}')
    end
  end
end

FactoryGirl.define do
  factory :user do
    email Forgery::Internet.email_address
    password Forgery::Basic.password
    password_confirmation Forgery::Basic.password
  end

  factory :doorkeeper_application, class: Doorkeeper::Application do
    name 'Ember frontend'
    redirect_uri 'http://jobs.atlrug.com'
  end

  factory :doorkeeper_token, class: Doorkeeper::AccessToken do
    application FactoryGirl.build(:doorkeeper_application)
    resource_owner_id FactoryGirl.build(:user).id
  end
end

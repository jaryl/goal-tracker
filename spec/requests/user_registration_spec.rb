require 'rails_helper'

RSpec.describe 'new user registration', type: :request do

  it 'successfully registers a user with valid params' do

    get '/users/new'

    assert_select 'form' do
      assert_select 'input[name=?]', 'user[name]'
      assert_select 'input[name=?]', 'user[email]'
      assert_select 'input[name=?]', 'user[password]'
    end

    post '/users', params: { user: { name: 'John Doe', email: 'john.doe@example.net', password: '123123123' } }

    expect(response).to redirect_to(my_account_path)
    follow_redirect!

    assert_select '#notice', text: 'Successfully asdasd registered!'

  end

  it 'fails user registration with invalid params' do

    get '/users/new'

    assert_select 'form' do
      assert_select 'input[name=?]', 'user[name]'
      assert_select 'input[name=?]', 'user[email]'
      assert_select 'input[name=?]', 'user[password]'
    end

    post '/users', params: { user: { name: '', email: '', password: '' } }

    assert_select '#notice', text: 'Please check your details'

  end

end

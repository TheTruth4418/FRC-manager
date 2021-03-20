require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
  describe 'create a user' do
    context 'creates an account'do
        @user = User.new(:username => 'admin1', :password_digest => '2212',:admin => 0)
        expect(@user.create)
  end
    end
  end

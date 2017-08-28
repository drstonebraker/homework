require 'rails_helper'

RSpec.describe User, type: :model do
  let(:password) do
    'abc123'
  end

  subject(:user) do
    create(:user,
    password: password,
    password_digest: BCrypt::Password.create(password))
  end

  describe 'User validations' do

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

  end

  describe 'User#is_password?' do
    it 'should return true with a valid password' do
      expect(user.is_password?(password)).to be(true)
    end
    it 'should return false with an invalid password' do
      expect(user.is_password?('password')).to be(false)
    end
  end

  describe 'User#reset_session_token!' do

    it 'persists to db' do
      token = user.reset_session_token!
      expect(User.find(user.id).session_token).to eq(token)
    end

    it 'resets token' do
      token = user.reset_session_token!
      expect(user.session_token).to eq(token)
      user.reset_session_token!
      expect(user.session_token).not_to eq(token)
    end

  end

  describe 'User::find_by_credentials' do
    context 'when email does not exist' do
      it 'returns nil ' do
        result = User.find_by_credentials('z@zzz.com', password)
        expect(result).to be(nil)
      end
    end
    context 'when password is not correct' do
      it 'returns nil' do
        result = User.find_by_credentials(user.email, 'password')
        expect(result).to be(nil)
      end
    end
    context 'when email and password are valid' do
      it 'returns user' do
        result = User.find_by_credentials(user.email, password)
        expect(result).to eq(user)
      end
    end
  end

end

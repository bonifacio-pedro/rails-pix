# frozen_string_literal: true

# frozen_string_literal = true

require 'rails_helper'

describe 'UserPix' do
  it 'keytype isnt valid' do
    user_pix = UserPix.new(username: 'test', keytype: 'TEST', key: 'test')
    user_pix.valid?
    expect(user_pix.errors.messages[:keytype]).to include('Invalid keytype')
  end
  it 'is not valid email' do
    user_pix = UserPix.new(username: 'test', keytype: 'EMAIL', key: 'invalidemail')
    user_pix.valid?
    expect(user_pix.errors[:name]).to include('Invalid email')
  end
  it 'is not valid cpf' do
    user_pix = UserPix.new(username: 'test', keytype: 'CPF', key: '000.000.000-00')
    user_pix.valid?
    expect(user_pix.errors[:name]).to include('Invalid CPF')
  end
  it 'not valid key type' do
    user_pix = UserPix.new(username: 'Test', keytype: 'XXX', key: 'email@test.com')
    user_pix.valid?
    expect(user_pix.errors.messages[:keytype]).to include('Invalid keytype')
  end
  it 'username already been taken' do
    UserPix.create(username: 'test', keytype: 'EMAIL', key: 'email@test.com')
    user_pix = UserPix.new(username: 'test', keytype: 'EMAIL', key: 'emailx@test.com')
    user_pix.valid?
    expect(user_pix.errors.messages[:username]).to include('Already been taken')
  end
  it 'pix-key already been taken' do
    UserPix.create(username: 'test', keytype: 'EMAIL', key: 'email@test.com')
    user_pix = UserPix.new(username: 'testx', keytype: 'EMAIL', key: 'email@test.com')
    user_pix.valid?
    expect(user_pix.errors.messages[:key]).to include('Already been taken')
  end
end

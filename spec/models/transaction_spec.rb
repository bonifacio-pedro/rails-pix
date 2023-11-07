# frozen_string_literal: true

require 'rails_helper'

describe 'Trasaction' do
  it 'payer key doesnt exists' do
    payer = UserPix.new(username: 'Test', keytype: 'EMAIL', key: 'email@test.com')
    receiver = UserPix.new(username: 'Testx', keytype: 'EMAIL', key: 'email@testx.com')
    transaction = Transaction.new(payer: payer.id.to_s + 'x', receiver:  receiver.id, price: 20.00)
    transaction.valid?
    expect(transaction.errors[:name]).to include('Invalid payer key')
  end
  it 'receiver key doesnt exists' do
    payer = UserPix.new(username: 'Test', keytype: 'EMAIL', key: 'email@test.com')
    receiver = UserPix.new(username: 'Testx', keytype: 'EMAIL', key: 'email@testx.com')
    transaction = Transaction.new(payer: payer.id.to_s, receiver:  receiver.id.to_s + 'x', price: 20.00)
    transaction.valid?
    expect(transaction.errors[:name]).to include('Invalid receiver key')
  end
  it 'payer and receiver key doesnt exists' do
    payer = UserPix.new(username: 'Test', keytype: 'EMAIL', key: 'email@test.com')
    receiver = UserPix.new(username: 'Testx', keytype: 'EMAIL', key: 'email@testx.com')
    transaction = Transaction.new(payer: payer.id.to_s + 'x', receiver:  receiver.id.to_s + 'x', price: 20.00)
    transaction.valid?
    expect(transaction.errors[:name]).to include('Invalid payer key', 'Invalid receiver key')
  end
end

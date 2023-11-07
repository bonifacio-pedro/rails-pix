# frozen_string_literal: true

# Validations to the model
class TransactionValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add :name, 'Invalid payer key' if UserPix.where(id: record.payer).size.zero?
    record.errors.add :name, 'Invalid receiver key' if UserPix.where(id: record.receiver).size.zero?
  end
end

# Transaction model
class Transaction < ApplicationRecord
  validates_with TransactionValidator
end

# Validates the UserPix model
class UserPixValidator < ActiveModel::Validator
  def validate(record)
    if record.keytype == 'EMAIL' && !URI::MailTo::EMAIL_REGEXP.match?(record.key)
      record.errors.add :name, 'Invalid email'
    end
    record.errors.add :name, 'Invalid CPF' if record.keytype == 'CPF' && !record.key.valid_cpf?
    record.errors.add :name, 'Invalid keytype' unless %w[CPF EMAIL].include?(record.keytype)
  end
end

# User-Pix model
class UserPix < ApplicationRecord
  validates :username, :keytype, :key, presence: true
  validates :username, :key, uniqueness: true
  validates_with UserPixValidator
end

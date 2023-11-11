# frozen_string_literal: true

# Transaction Controller
class TransactionController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def index
    render json: Transaction.all
  end

  def create
    @transaction = Transaction.new params_transactions

    return render json: @transaction, status: :created if @transaction.save

    render json: @transaction.errors, status: :unprocessable_entity
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    head :ok
  end

  private

  def params_transactions
    params.permit(:payer, :receiver, :price)
  end
end

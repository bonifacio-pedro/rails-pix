# frozen_string_literal: true

# User Pix Controller
class PixController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  def index
    render json: UserPix.all
  end

  def create
    @user_pix = UserPix.new params_user_pixes

    return render json: @user_pix, status: :created if @user_pix.save

    render json: @user_pix.errors, status: :unprocessable_entity
  end

  def destroy
    @user_pix = UserPix.find(params[:id])
    @user_pix.destroy

    # Return only a head with 200 [OK]
    head :ok
  end

  private

  def params_user_pixes
    params.permit(:username, :keytype, :key)
  end
end

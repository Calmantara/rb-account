class Api::V1::AccountsController < ApplicationController
  def index
    @account = Account.all()
    render json: @account, status: :ok
  end

  def create
    @account = Account.create(account_params)
    @account.save
    render json: @account, status: :created
  end
 
   def destroy
      @account = Account.find(params[:id])
      if @account.destroy!
         render json: {"message":"success"}, status: :accepted
      end
   rescue ActiveRecord::RecordNotDestroyed
      render json: @account, status: :unprocessable_entity
   end

   private
   def account_params
      params.
         require(:account).
         permit(:username, :email, :password)   
   end
end

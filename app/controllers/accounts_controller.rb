class Api::V1::AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  before_action :find_user_by_id, only: [:log_out]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # Sign out function for accounts
  def log_out
    if @account
      @account.update(authentication_token: nil)
      format.html { redirect_to accounts_url(@account) notice: "Successfully logged out."}
      format.json { render: :show, status: :ok, location: @account}
    else
      format.html { redirect_to accounts_url(@account) notice "User not found or already logged out."}
      format.json { render json: @account.errors, status: :not_found }
    end
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account:params[:account][:first_name][:last_name][:num_of_songs_you_want][:username])
    @account.password = params[:account][:password]

    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to accounts_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy!

    respond_to do |format|
      format.html { redirect_to accounts_url, status: :see_other, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Calls back the user's main account that is attempting to log out
    def find_user_by_id
      @account = Account.find_by(id: params[:id])
    end

    def authentication_token
      token = request.headers['Authorization']&.split('')&.last
      render json: { error: 'Unauthorized' }, status: :unauthorized unless valid_token?(token)
    end

    def valid_token?(token)
      @account = Account.find_by(authentication_token: token)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
      Rails.logger.info "Account: #{params.inspect}"
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:first_name, :last_name, :num_of_songs_you_want, :username)
    end
end

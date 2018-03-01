class ContractPlansController < ApplicationController
  before_action :set_contract_plan, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  # GET /contract_plans
  # GET /contract_plans.json
  def index
    @contract_plans = ContractPlan.all
  end

  # GET /contract_plans/1
  # GET /contract_plans/1.json
  def show
  end

  # GET /contract_plans/new
  def new
    @contract_plan = ContractPlan.new
  end

  # GET /contract_plans/1/edit
  def edit
  end

  # POST /contract_plans
  # POST /contract_plans.json
  def create
    @contract_plan = ContractPlan.new(contract_plan_params)

    respond_to do |format|
      if @contract_plan.save
        format.html { redirect_to @contract_plan, notice: 'Contract plan was successfully created.' }
        format.json { render :show, status: :created, location: @contract_plan }
      else
        format.html { render :new }
        format.json { render json: @contract_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contract_plans/1
  # PATCH/PUT /contract_plans/1.json
  def update
    respond_to do |format|
      if @contract_plan.update(contract_plan_params)
        format.html { redirect_to @contract_plan, notice: 'Contract plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract_plan }
      else
        format.html { render :edit }
        format.json { render json: @contract_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_plans/1
  # DELETE /contract_plans/1.json
  def destroy
    @contract_plan.destroy
    respond_to do |format|
      format.html { redirect_to contract_plans_url, notice: 'Contract plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_plan
      @contract_plan = ContractPlan.find(params[:id])
      authorize @contract_plan
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_plan_params
      params.require(:contract_plan).permit(:hash_rate, :price, :contract_long)
    end
end

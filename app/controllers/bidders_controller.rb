class BiddersController < ApplicationController
  before_action :set_bidder, only: [:show, :edit, :update, :destroy]

  # GET /bidders
  # GET /bidders.json
  def index
    @bidders = Bidder.all
  end

  # GET /bidders/1
  # GET /bidders/1.json
  def show
  end

  # GET /bidders/new
  def new
    @bidder = Bidder.new
  end

  # GET /bidders/1/edit
  def edit
  end

  # POST /bidders
  # POST /bidders.json
  def create
    @bidder = Bidder.new(bidder_params)

    respond_to do |format|
      if @bidder.save
        format.html { redirect_to @bidder, notice: 'Bidder was successfully created.' }
        format.json { render :show, status: :created, location: @bidder }
      else
        format.html { render :new }
        format.json { render json: @bidder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bidders/1
  # PATCH/PUT /bidders/1.json
  def update
    respond_to do |format|
      if @bidder.update(bidder_params)
        format.html { redirect_to @bidder, notice: 'Bidder was successfully updated.' }
        format.json { render :show, status: :ok, location: @bidder }
      else
        format.html { render :edit }
        format.json { render json: @bidder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bidders/1
  # DELETE /bidders/1.json
  def destroy
    @bidder.destroy
    respond_to do |format|
      format.html { redirect_to bidders_url, notice: 'Bidder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bidder
      @bidder = Bidder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bidder_params
      params.require(:bidder).permit(:first_name, :last_name, :limit, :decimal, :active)
    end
end

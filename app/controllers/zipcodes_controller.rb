class ZipcodesController < ApplicationController
  before_action :set_zipcode, only: [:show, :edit, :update, :destroy]

  # GET /zipcodes
  # GET /zipcodes.json
  def index
    @zipcodes = Zipcode.all
  end

  # GET /zipcodes/1
  # GET /zipcodes/1.json
  def show
  end

  # GET /zipcodes/new
  def new
    @zipcode = Zipcode.new
  end

  # GET /zipcodes/1/edit
  def edit
  end

  # POST /zipcodes
  # POST /zipcodes.json
  def create
    @zipcode = Zipcode.new(zipcode_params)

    respond_to do |format|
      if @zipcode.save
        format.html { redirect_to @zipcode, notice: 'Zipcode was successfully created.' }
        format.json { render :show, status: :created, location: @zipcode }
      else
        format.html { render :new }
        format.json { render json: @zipcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zipcodes/1
  # PATCH/PUT /zipcodes/1.json
  def update
    respond_to do |format|
      if @zipcode.update(zipcode_params)
        format.html { redirect_to @zipcode, notice: 'Zipcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @zipcode }
      else
        format.html { render :edit }
        format.json { render json: @zipcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zipcodes/1
  # DELETE /zipcodes/1.json
  def destroy
    @zipcode.destroy
    respond_to do |format|
      format.html { redirect_to zipcodes_url, notice: 'Zipcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zipcode
      @zipcode = Zipcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zipcode_params
      params.require(:zipcode).permit(:value, :image_path)
    end
end

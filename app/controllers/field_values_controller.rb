class FieldValuesController < ApplicationController
  before_action :set_field_value, only: [:show, :edit, :update, :destroy]

  # GET /field_values
  # GET /field_values.json
  def index
    @field_values = FieldValue.all
  end

  # GET /field_values/1
  # GET /field_values/1.json
  def show
  end

  # GET /field_values/new
  def new
    @field_value = FieldValue.new
  end

  # GET /field_values/1/edit
  def edit
  end

  # POST /field_values
  # POST /field_values.json
  def create
    @field_value = FieldValue.new(field_value_params)

    respond_to do |format|
      if @field_value.save
        format.html { redirect_to @field_value, notice: 'Field value was successfully created.' }
        format.json { render :show, status: :created, location: @field_value }
      else
        format.html { render :new }
        format.json { render json: @field_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_values/1
  # PATCH/PUT /field_values/1.json
  def update
    respond_to do |format|
      if @field_value.update(field_value_params)
        format.html { redirect_to @field_value, notice: 'Field value was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_value }
      else
        format.html { render :edit }
        format.json { render json: @field_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_values/1
  # DELETE /field_values/1.json
  def destroy
    @field_value.destroy
    respond_to do |format|
      format.html { redirect_to field_values_url, notice: 'Field value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_value
      @field_value = FieldValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_value_params
      params.require(:field_value).permit(:field_id, :value, :display_value, :card_id)
    end
end

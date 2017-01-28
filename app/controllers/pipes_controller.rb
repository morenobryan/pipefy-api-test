class PipesController < ApplicationController
  before_action :set_pipe, only: [:show, :edit, :update, :destroy]

  # GET /pipes
  # GET /pipes.json
  def index
    @pipes = Pipe.all
  end

  # GET /pipes/1
  # GET /pipes/1.json
  def show
  end

  # GET /pipes/new
  def new
    @pipe = Pipe.new
  end

  # GET /pipes/1/edit
  def edit
  end

  # POST /pipes
  # POST /pipes.json
  def create
    @pipe = Pipe.new(pipe_params)

    respond_to do |format|
      if @pipe.save
        format.html { redirect_to @pipe, notice: 'Pipe was successfully created.' }
        format.json { render :show, status: :created, location: @pipe }
      else
        format.html { render :new }
        format.json { render json: @pipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pipes/1
  # PATCH/PUT /pipes/1.json
  def update
    respond_to do |format|
      if @pipe.update(pipe_params)
        format.html { redirect_to @pipe, notice: 'Pipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @pipe }
      else
        format.html { render :edit }
        format.json { render json: @pipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pipes/1
  # DELETE /pipes/1.json
  def destroy
    @pipe.destroy
    respond_to do |format|
      format.html { redirect_to pipes_url, notice: 'Pipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pipe
      @pipe = Pipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pipe_params
      params.require(:pipe).permit(:name, :token, :can_edit, :organization_id)
    end
end

class PseudosController < ApplicationController
  before_action :set_pseudo, only: [:show, :edit, :update, :destroy]

  # GET /pseudos
  # GET /pseudos.json
  def index
    @pseudos = Pseudo.all
  end

  # GET /pseudos/1
  # GET /pseudos/1.json
  def show
  end

  # GET /pseudos/new
  def new
    @pseudo = Pseudo.new
  end

  def upvote
    @pseudo = Pseudo.find(params[:pseudo_id])
    @pseudo.votes += 1
    @pseudo.save
  end

  def downvote
    @pseudo = Pseudo.find(params[:pseudo_id])
    @pseudo.votes -= 1
    @pseudo.save
  end

  # GET /pseudos/1/edit
  def edit
  end

  # POST /pseudos
  # POST /pseudos.json
  def create
    @pseudo = Pseudo.new(pseudo_params)

    respond_to do |format|
      if @pseudo.save
        format.html { redirect_to @pseudo, notice: 'Pseudo was successfully created.' }
        format.json { render :show, status: :created, location: @pseudo }
      else
        format.html { render :new }
        format.json { render json: @pseudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pseudos/1
  # PATCH/PUT /pseudos/1.json
  def update
    respond_to do |format|
      if @pseudo.update(pseudo_params)
        format.html { redirect_to @pseudo, notice: 'Pseudo was successfully updated.' }
        format.json { render :show, status: :ok, location: @pseudo }
      else
        format.html { render :edit }
        format.json { render json: @pseudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pseudos/1
  # DELETE /pseudos/1.json
  def destroy
    @pseudo.destroy
    respond_to do |format|
      format.html { redirect_to pseudos_url, notice: 'Pseudo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pseudo
      @pseudo = Pseudo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pseudo_params
      params.require(:pseudo).permit(:fake_name, :real_name, :votes)
    end
end

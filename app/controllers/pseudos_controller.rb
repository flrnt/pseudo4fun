class PseudosController < ApplicationController
  before_action :set_pseudo, only: [:show, :edit, :update, :destroy]

  def index
    @pseudos = Pseudo.all.sort_by { |pseudo| pseudo.votes }.reverse
    @last_pseudos = Pseudo.last(3).reverse
  end

  def show
  end

  def new
    @pseudo = Pseudo.new
  end

  def upvote
    @pseudo = Pseudo.find(params[:pseudo_id])
    @pseudo.votes += 1
    @pseudo.save
    redirect_to root_path
  end

  def edit
  end

  def create
    @pseudo = Pseudo.new(pseudo_params)
    if @pseudo.save
      redirect_to "/"
    else
      render :new
    end
  end

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

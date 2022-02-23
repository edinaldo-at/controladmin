require 'tempfile'
class TbAdminsController < ApplicationController
  before_action :set_tb_admin, only: %i[ show edit update destroy ]

  # GET /tb_admins or /tb_admins.json
  def index
    @tb_admins = TbAdmin.all
  end

  # GET /tb_admins/1 or /tb_admins/1.json
  def show
  end

  # GET /tb_admins/new
  def new
    @tb_admin = TbAdmin.new
  end

  # GET /tb_admins/1/edit
  def edit
  end

  def importar
    data = TbAdmin.import(params[:csv])
    flash[:notice] = "Countries uploaded successfully"
    redirect_to tb_admins_path #=> or where you want
  end

  # POST /tb_admins or /tb_admins.json
  def create
    @tb_admin = TbAdmin.new(tb_admin_params)

    respond_to do |format|
      if @tb_admin.save
        format.html { redirect_to new_tb_admin_url(@tb_admin, cliente: tb_admin_params[:cliente], userlocal: tb_admin_params[:userlocal]), notice: "Tb admin was successfully created."}
        format.json { render :show, status: :created, location: @tb_admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tb_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tb_admins/1 or /tb_admins/1.json
  def update
    respond_to do |format|
      if @tb_admin.update(tb_admin_params)
        format.html { redirect_to tb_admin_url(@tb_admin), notice: "Tb admin was successfully updated." }
        format.json { render :show, status: :ok, location: @tb_admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tb_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tb_admins/1 or /tb_admins/1.json
  def destroy

    if (current_user.email =='julio@skylan.com.br')
      @tb_admin.destroy

      respond_to do |format|
        format.html { redirect_to tb_admins_url, notice: "Tb admin was successfully destroyed." }
        format.json { head :no_content }
      end
    else 
      flash[:alert] = "Você não pode executar essa operação"
      redirect_to tb_admins_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tb_admin
      @tb_admin = TbAdmin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tb_admin_params
      params.require(:tb_admin).permit(:cliente, :computador, :userlocal, :senha, :public_key)
    end
end

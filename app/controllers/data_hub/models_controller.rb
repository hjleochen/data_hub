require_dependency "data_hub/application_controller"

module DataHub
  class ModelsController < ApplicationController
    before_action :set_model, only: [:edit, :update, :destroy]

    # GET /models
    def index
      @models = Model.all
    end

    # GET /models/new
    def new
      @model = Model.new
    end

    # GET /models/1/edit
    def edit
    end

    # POST /models
    def create
      @model = Model.new(model_params)

      if @model.save
        redirect_to models_path, notice: 'Model was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /models/1
    def update
      if @model.update(model_params)
        redirect_to models_path, notice: 'Model was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /models/1
    def destroy
      @model.destroy
      redirect_to models_url, notice: 'Model was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_model
        @model = Model.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def model_params
        params.require(:model).permit(:name, :tbl_name, :mdl_name, :pk_field, :display_field, :search_keys, :output_fields)
      end
  end
end

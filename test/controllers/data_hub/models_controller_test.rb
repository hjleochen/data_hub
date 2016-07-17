require 'test_helper'

module DataHub
  class ModelsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @model = data_hub_models(:one)
    end

    test "should get index" do
      get models_url
      assert_response :success
    end

    test "should get new" do
      get new_model_url
      assert_response :success
    end

    test "should create model" do
      assert_difference('Model.count') do
        post models_url, params: { model: { display_field: @model.display_field, pk_field: @model.pk_field, mdl_name: @model.mdl_name, name: @model.name, output_fields: @model.output_fields, search_keys: @model.search_keys, tbl_name: @model.tbl_name } }
      end

      assert_redirected_to models_url
    end

    test "should get edit" do
      get edit_model_url(@model)
      assert_response :success
    end

    test "should update model" do
      patch model_url(@model), params: { model: { display_field: @model.display_field, pk_field: @model.pk_field, mdl_name: @model.mdl_name, name: @model.name, output_fields: @model.output_fields, search_keys: @model.search_keys, tbl_name: @model.tbl_name } }
      assert_redirected_to models_url
    end

    test "should destroy model" do
      assert_difference('Model.count', -1) do
        delete model_url(@model)
      end

      assert_redirected_to models_url
    end
  end
end

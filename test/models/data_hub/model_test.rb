require 'test_helper'

module DataHub
  class ModelTest < ActiveSupport::TestCase
    setup do
      unless Object.const_defined?( 'User' )
        Object.const_set(
          'User', Class.new(ActiveRecord::Base) {
            self.table_name = "data_hub_models"
            self.primary_key = 'id'
          }
        )
      end
    end

    test "respond to model_class" do
      one = data_hub_models(:one)
      assert_respond_to one, :model_class
    end

    test "model_class for exists model" do
      one = data_hub_models(:one)
      assert_kind_of DataHub::Model.class, one.model_class
    end

    test "model_class for exists parent's model" do
      user = data_hub_models(:user)
      assert_kind_of User.class, user.model_class
    end

    test "new class for model_class" do
      account = data_hub_models(:account)
      assert_kind_of Class, account.model_class
    end

    test "is new class for model_class in module DataHub" do
      account = data_hub_models(:account)
      assert_equal "DataHub::Account", account.model_class.name
    end

    test "is new model is subclass of ActiveRecord::Base" do
      account = data_hub_models(:account)
      assert account.model_class < ActiveRecord::Base
    end
  end
end

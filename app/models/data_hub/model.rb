module DataHub
  class Model < ApplicationRecord
    validates_presence_of :name, :tbl_name, :mdl_name, :pk_field, :display_field

    def model_class
      #get parent app's Model
      model_name = self.mdl_name
      if Object.const_defined?( model_name )
        return model_name.constantize
      end

      #get DataHub's Model
      if DataHub.const_defined? mdl_name
        return DataHub.const_get mdl_name
      end

      #define a Model in module DataHub
      tbl_name = self.tbl_name
      pk_field = self.pk_field

      DataHub.const_set(
        mdl_name, Class.new(ApplicationRecord) { 
          self.table_name = tbl_name
          self.primary_key = pk_field
        }
      )
    end

  end
end

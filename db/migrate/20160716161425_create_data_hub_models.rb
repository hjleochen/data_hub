class CreateDataHubModels < ActiveRecord::Migration[5.0]
  def change
    create_table :data_hub_models do |t|
      t.string :name, null: false
      t.string :tbl_name, null: false
      t.string :mdl_name, null: false
      t.string :pk_field, default: 'id', null: false
      t.string :display_field, null: false
      t.string :search_keys, null: false, default: 'id_eq'
      t.text :output_fields, default: ''

      t.timestamps
    end
  end
end

class CreateContexts < ActiveRecord::Migration[5.0]
  def change
    create_table :contexts do |t|
      t.string :name
      t.integer :parent_context_id, null: true
      t.boolean :is_public, null: false, default: false
      t.jsonb :settings, null: false, default: '{}'

      t.timestamps
    end

    add_index :contexts, :parent_context_id
    add_foreign_key :contexts, :contexts, column: :parent_context_id
  end
end

class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :name
      t.text :description
      t.string :license
      t.integer :chorus_id, null: false
      t.integer :user_id
      t.integer :context_id
      t.jsonb :settings, null: false, default: '{}'

      t.timestamps
    end

    add_index :responses, :user_id
    add_index :responses, :context_id
    add_index :responses, :chorus_id
    add_foreign_key :responses, :users
    add_foreign_key :responses, :contexts
    add_foreign_key :responses, :choruses
  end
end

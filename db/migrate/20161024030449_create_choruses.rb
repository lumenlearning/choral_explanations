class CreateChoruses < ActiveRecord::Migration[5.0]
  def change
    create_table :choruses do |t|
      t.string :name
      t.text :description
      t.integer :context_id
      t.integer :user_id
      t.string :learning_outcome_guid
      t.string :license
      t.jsonb :settings, null: false, default: '{}'

      t.timestamps
    end

    add_index :choruses, :user_id
    add_index :choruses, :context_id
    add_foreign_key :choruses, :users
    add_foreign_key :choruses, :contexts
  end
end

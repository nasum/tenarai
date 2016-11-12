class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.integer :status, null: false, default: 0

      t.timestamps
    end
    add_index :articles, [:user_id, :created_at]
  end
end

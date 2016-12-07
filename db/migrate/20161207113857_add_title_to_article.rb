class AddTitleToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :title, :string, after: :user_id
  end
end

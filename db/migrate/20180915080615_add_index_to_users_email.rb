class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true # データベースレベルでデータの一意性を担保
  end
end

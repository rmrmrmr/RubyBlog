class AddUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :auhor, null: false, foreign_key: { to_table: :users }, index: { unique: true, name: 'user_like_index'}
  end
end

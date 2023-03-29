class AddUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, null: false, foreign_key: true, index: {unique: false, name: 'user_like_index'}
  end
end

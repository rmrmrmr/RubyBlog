class AddPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, null: false, foreign_key: true,  index: {unique: false, name: 'post_like_index'}
  end
end

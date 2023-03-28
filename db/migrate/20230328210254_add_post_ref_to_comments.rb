class AddPostRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, null: false, foreign_key: true, index: { unique: true, name: 'post_comment_index'}
  end
end

class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true, index: { unique: true, name: 'user_comment_index'}
  end
end

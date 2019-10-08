class AddAvatarToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :avatar, :string
  end
end

class AddContactIdToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :contact_id, :bigint
  end
end

class RemoveImagesFromContacts < ActiveRecord::Migration[5.1]
  def change
    remove_column :contacts, :images, :string
  end
end

class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :content
      t.references :user
      t.string :images

      t.timestamps
    end
  end
end

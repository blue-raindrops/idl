class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :title
      t.string :contact
      t.string :site
      t.string :projects

      t.timestamps
    end
  end
end

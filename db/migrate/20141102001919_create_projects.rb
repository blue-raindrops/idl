class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :people
      t.string :string

      t.timestamps
    end
  end
end

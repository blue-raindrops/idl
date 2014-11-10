class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :index
      t.string :people
      t.string :projects
      t.string :publications
      t.string :contact

      t.timestamps
    end
  end
end

class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :year
      t.string :citation

      t.timestamps
    end
  end
end

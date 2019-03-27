class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :student, foreign_key: true
      t.boolean :checked, default: false
      t.string :file
      t.timestamps
    end
  end
end

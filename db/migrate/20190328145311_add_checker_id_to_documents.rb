class AddCheckerIdToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :checker, foreign_key: { to_table: 'students' }, after: 'checked'
  end
end

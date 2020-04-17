class CreatePoliticas < ActiveRecord::Migration[6.0]
  def change
    create_table :politicas do |t|
      t.string :conjunto_politicas
      t.string :revision_politicas
      t.references :empresa, foreign_key: true
      t.timestamps
    end
  end
end

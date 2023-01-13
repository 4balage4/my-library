class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :writer
      t.integer :year
      t.string :language
      t.string :genree
      t.integer :pages
      t.string :status
      t.date :date_finished
      t.string :print
      t.date :purchased
      t.string :lended
      t.string :lended_to
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

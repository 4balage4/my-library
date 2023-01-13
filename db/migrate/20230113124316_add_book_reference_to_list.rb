class AddBookReferenceToList < ActiveRecord::Migration[7.0]
  def change
    add_reference :lists, :book,  foreign_key: true
  end
end

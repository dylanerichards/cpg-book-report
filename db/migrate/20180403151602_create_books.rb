class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.date :release_date
      t.decimal :base_price
      t.integer :format_id

      t.timestamps
    end
  end
end

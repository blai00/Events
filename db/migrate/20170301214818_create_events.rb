class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :location
      t.references :host, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

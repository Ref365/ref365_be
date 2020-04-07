class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.text :notes
      t.datetime :date
      t.timestamp :time
      t.float :mileage
      t.float :income

      t.timestamps
    end
  end
end

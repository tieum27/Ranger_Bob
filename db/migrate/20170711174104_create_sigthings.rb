class CreateSigthings < ActiveRecord::Migration[5.1]
  def change
    create_table :sigthings do |t|
      t.date :date
      t.time :time
      t.string :region
      t.string :latitude
      t.string :longitude
      t.references :animal, foreign_key: true

      t.timestamps
    end
  end
end

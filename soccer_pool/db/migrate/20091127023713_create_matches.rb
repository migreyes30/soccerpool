# ITESM CEM, December 1, 2009.
# Ruby Source File
# Activity: Soccer Pool
# Authors:
# 967171 Maricela Obeso
# 466044 Miguel Ramirez

class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.integer :pool_id
      t.string :local
      t.string :visitor
      t.string :result

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end

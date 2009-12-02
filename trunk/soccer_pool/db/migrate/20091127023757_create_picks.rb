# ITESM CEM, December 1, 2009.
# Ruby Source File
# Activity: Soccer Pool
# Authors:
# 967171 Maricela Obeso
# 466044 Miguel Ramirez

class CreatePicks < ActiveRecord::Migration
  def self.up
    create_table :picks do |t|
      t.integer :user_id
      t.integer :match_id
      t.string :pick

      t.timestamps
    end
  end

  def self.down
    drop_table :picks
  end
end

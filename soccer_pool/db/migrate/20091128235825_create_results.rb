class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :user_id
      t.integer :pool_id
      t.integer :match_id
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end

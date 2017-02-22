class CreateDollars < ActiveRecord::Migration[5.0]
  def change
    create_table :dollars do |t|
      t.float :real_value, default: 0
      t.float :force_value, default: 0
      t.datetime :force_time
      t.timestamps
    end
  end
end

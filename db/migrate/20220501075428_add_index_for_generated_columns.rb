class AddIndexForGeneratedColumns < ActiveRecord::Migration[7.0]
  def change
    add_index :metric_infos, :day
    add_index :metric_infos, :hour
    add_index :metric_infos, :minute
  end
end

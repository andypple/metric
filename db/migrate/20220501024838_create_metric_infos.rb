class CreateMetricInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :metric_infos do |t|
      t.datetime :timestamp_value, null: false
      t.string :name
      t.decimal :value, null: false

      t.timestamps
    end
  end
end

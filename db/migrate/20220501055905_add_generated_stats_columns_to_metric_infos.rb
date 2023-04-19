class AddGeneratedStatsColumnsToMetricInfos < ActiveRecord::Migration[7.0]
  def change
    add_column :metric_infos, :day, :date, as: "DATE(timestamp_value)", stored: true, index: true
  end
end

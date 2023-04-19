class AddGeneratedHourColumnsToMetricInfos < ActiveRecord::Migration[7.0]
  def change
    add_column :metric_infos, :hour, :integer, as: "EXTRACT(HOUR FROM timestamp_value)", stored: true, index: true
  end
end

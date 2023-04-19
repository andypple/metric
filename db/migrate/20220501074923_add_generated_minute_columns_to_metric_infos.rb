class AddGeneratedMinuteColumnsToMetricInfos < ActiveRecord::Migration[7.0]
  def change
    add_column :metric_infos, :minute, :integer, as: "EXTRACT(MINUTE FROM timestamp_value)", stored: true, index: true
  end
end

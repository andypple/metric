class MetricInfo < ApplicationRecord
  validates :timestamp_value, :value, presence: true
  NAME_FUNCTION = {
    'day' => "to_char(day, 'Mon DD YY')",
    'hour' => "concat(to_char(day, 'Mon DD YY'), ' ', hour, ':', '00')",
    'minute' => "concat(to_char(day, 'Mon DD YY'), ' ', hour, ':', minute)"
  }

  GROUP_COLUMNS = {
    'day' => ['day'],
    'hour' => %w[day hour],
    'minute' => %w[day hour minute]
  }.freeze

  scope :stats, lambda { |timestamp_type|
                  group(*GROUP_COLUMNS[timestamp_type]).select("#{NAME_FUNCTION[timestamp_type]} as name, avg(value) as avg_value")
                }
end

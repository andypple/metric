# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

### Generate day data
range = (-5..5).to_a

data = range.product(range, range).map do |day_idx, hour_idx, min_idx|
  (1..rand(20)).map do |_idx|
    timestamp = Time.current.advance(days: day_idx, hours: hour_idx, minutes: min_idx)
    { name: SecureRandom.hex(2), timestamp_value: timestamp, value: rand(1.0..30.0),
      created_at: Time.current, updated_at: Time.current }
  end
end

MetricInfo.insert_all(data.flatten)

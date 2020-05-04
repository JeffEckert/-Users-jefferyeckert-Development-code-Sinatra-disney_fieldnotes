Attraction.destroy_all

puts "seeding database..."
"source API"::Adapter.new.fetch_attractions
puts "done"
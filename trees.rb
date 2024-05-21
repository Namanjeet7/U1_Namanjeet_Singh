require 'net/http'
require 'json'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json'
uri = URI(url)
response = Net::HTTP.get(uri)
tree_data = JSON.parse(response) # Convert JSON data into Ruby data.

ash_tree_count = 0

tree_data.each do |tree|
  if tree['common_name']&.downcase&.include?('ash')
    ash_tree_count += 1
  end
end

puts "Number of Ash trees in the dataset: #{ash_tree_count}"

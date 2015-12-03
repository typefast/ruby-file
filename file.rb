require 'rest-client'

begin
  resource = RestClient.get('https://en.wikipedia.org')
rescue StandardError => e
  puts e
end

if resource
  puts "Page copied"
  File.open('my-wiki-copy.txt', 'w') { |file| file.puts resource.body } 
  
  puts "Preparing to read..."
  sleep 3
  
  document = File.open('my-wiki-copy.txt', 'r') { |file| file.read }
  puts document
end
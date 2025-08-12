require "socket"

server = TCPServer.new("localhost", 3003)

def read_params(string)                        # parses the query string component of the URL
  output_hash = {}

  query_string = string.split("?").last        # "rolls=2&sides=6"
  query_string_array = query_string.split("&") # ["rolls=2", "sides=6"]
  query_string_array.each do |param_pair|
    param_pair_array = param_pair.split("=")   # ["name", "value"]
    output_hash[param_pair_array.first] = param_pair_array.last # {"name"="value"}
  end

  output_hash
end

def calc_dice_roll(hash)                       # calculate random dice roll total using params hash
  total = 0
  no_of_rolls = hash["rolls"].to_i
  sides_of_dice = hash["sides"].to_i
  
  no_of_rolls.times { total += rand(sides_of_dice)}
  total
end

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  
  request_line_array = request_line.split(" ") # ["GET", "/?rolls=2&sides=6", "HTTP", "1.1"]

  http_method = request_line_array[0]
  path = request_line_array[1].split("?").first # only one ? in string
  params = read_params(request_line_array[1])

  puts http_method, path, params

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"
  client.puts request_line

  # output method invocations to browser for debugging
  # client.puts http_method
  # client.puts path
  # client.puts params

  client.puts calc_dice_roll(params)

  client.close
end
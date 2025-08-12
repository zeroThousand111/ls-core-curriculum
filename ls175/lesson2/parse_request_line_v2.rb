require "socket"

server = TCPServer.new("localhost", 3003)

def read_params(string)
  output_hash = {}

  query_string = string.split("?").last
  query_string_array = query_string.split("&")
  query_string_array.each do |param_pair|
    param_pair_array = param_pair.split("=")
    output_hash[param_pair_array.first] = param_pair_array.last
  end

  output_hash
end

def calc_dice_roll(hash)                       
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

  http_method, path_and_query, protocol, version = request_line.split(" ")

  params = read_params(path_and_query)
  dice_roll = calc_dice_roll(params)

  puts http_method, path_and_query, params, dice_roll

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"
  client.puts request_line
  client.puts dice_roll

  client.close
end
require 'socket'
require 'json'

# host = 'www.tutorialspoint.com'     # The web server
host = 'localhost'
port = 2000                           # Default HTTP port
path = "/index.html"                 # The file we want

puts "Send a [G]ET or [P]OST request?"
input = gets.chomp

# POST request
if input == 'p' || input == 'P'
  # get data
  print "Name: "
  name = gets.chomp
  print "Email: "
  email = gets.chomp

  # store results
  content = {:viking => {:name=>name, :email=>email}}.to_json
  content_length = content.size
  status = "POST /thanks.html HTTP/1.0"
  request = "#{status}\r\nContent-Length: #{content_length}\r\n\r\n#{content}"

# GET request
elsif input == 'g' || input == 'G'
  # This is the HTTP request we send to fetch a file
  request = "GET #{path} HTTP/1.0\r\n\r\n"
end


  socket = TCPSocket.open(host,port)  # Connect to server
  socket.print(request)               # Send request
  response = socket.read              # Read complete response
  # Split response at first blank line into headers and body
  headers,body = response.split("\r\n\r\n", 2)
  print body                          # And display it
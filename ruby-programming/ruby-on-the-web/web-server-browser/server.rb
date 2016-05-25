require 'socket'               # Get sockets from stdlib
require 'json'

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  # client.puts(Time.now.ctime)  # Send the time to the client

  # parse request
  request = client.read_nonblock(256) # TODO: fix gets to read all lines
  header, body = request.split("\r\n\r\n", 2)
  method = header.split[0]
  path = header.split[1]
  version = header.split[2]

  file = ".#{path}"
  response = ""

  # build response
  if File.exist?(file)
    status = "#{version} 200 OK"
    if method == "GET"
      content_length = File.size(file)
      content = File.open(file).read
    else method == "POST"
      # turn flat json data back to hash
      params = JSON.parse(body)

      data = "<li>Name: #{params["viking"]["name"]}</li><li>Email: #{params["viking"]["email"]}</li>"

      content = File.open(file).read.gsub("<%= yield %>", data)
      content_length = content.bytesize
    end
    response = "#{status}\r\nContent-Length: #{content_length}\r\n\r\n#{content}"
  else
    status = "#{version} 404 Not Found"
    response = status
  end

  # Print the actual response body
  client.print(response)

  client.close                 # Disconnect from the client
}
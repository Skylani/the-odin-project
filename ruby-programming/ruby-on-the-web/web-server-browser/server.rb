require 'socket'               # Get sockets from stdlib
require 'json'

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  # client.puts(Time.now.ctime)  # Send the time to the client

  # parse request
  request = client.gets # TODO: fix gets to read all lines
  puts "request: #{request}"
  header, body = request.split("\r\n\r\n", 2)
  method = header.split[0]
  path = header.split[1]
  version = header.split[2]

  # request = client.gets.split(" ")
  # method = request[0]
  # path = request[1]
  # version = request[2]

  file = ".#{path}"
  response = ""

  # build response
  if method == "GET"
    if File.exist?(file)
      status = "#{version} 200 OK"
      content_length = File.size(file)
      content = File.open(file).read
      response = "#{status}\r\nContent-Length: #{content_length}\r\n\r\n#{content}"
    else
      status = "#{version} 404 Not Found"
      response = status
    end

  elsif method == "POST"
    puts "header: #{header}"
    puts "body: #{body}"
    if File.exist?(file)
      # turn flat json data back to hash
      params = {}
      params << JSON.parse(body)

      data = "<li>Name: #{params[:viking][:name]}</li><li>Email: #{params[:viking][:email]}</li>"

      response = File.open(file).read.gsub("<%= yield %>", data)

    else
      response = "File Not Found"
    end

  end

  # Print the actual response body
  client.print(response)

  client.close                 # Disconnect from the client
}
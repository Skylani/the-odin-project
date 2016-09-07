#A Real Web Server and Browser (from the command line)

A simple web server and a simple browser client that can talk to each other. This project is made for [The Odin Project](http://theodinproject.com)'s [Projects: Ruby on the Web](http://www.theodinproject.com/ruby-programming/ruby-on-the-web).

##Sample output

Use browser to send a GET request
```
Lanis-Air:web-server-browser lani$ ruby browser.rb
Send a [G]ET or [P]OST request?
g
<html>
  <body>
    <h1>Welcome to the Viking Home Page</h1>
  </body>
</html>
```

Use browser to send a POST request
```
Lanis-Air:web-server-browser lani$ ruby browser.rb
Send a [G]ET or [P]OST request?
p
Name: Lani
Email: laniywh@gmail.com
<html>
  <body>
    <h1>Thanks for Posting!</h1>
    <h2>Here's what we got from you:</h2>
    <ul>
      <li>Name: Lani</li><li>Email: laniywh@gmail.com</li>
    </ul>
  </body>
</html>
```

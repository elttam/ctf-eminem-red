#!/usr/bin/env ruby

require "sinatra"
require "base64"

class Gem::StubSpecification; def data; raise "no-data-for-you"; end; end

class Greeter
  def run
    "Greetings! The time is #{Time.now}."
  end
end

class Flag
  def run
    File.read("flag.txt")
  end
end

def serialize(obj)
  Base64.urlsafe_encode64(Marshal.dump(obj))
end

def unserialize(serialized)
  Marshal.load(Base64.urlsafe_decode64(serialized))
end

configure do
  enable :inline_templates
end

helpers do
  include ERB::Util
end

get "/" do
  @title = "Infinite"
  @serialized_greeter = serialize(Greeter.new)

  erb :index
end

get "/source" do
  File.read(__FILE__)
end

get "/runner" do
  greeter = unserialize(params[:serialized_data].to_s)
  @output = greeter.run
  erb :runner
end

__END__

@@ layout
<!doctype html>
<html>
 <head>
  <style>
    body {
      background: red;
    }
  </style>
  <title><%= h @title %></title>
 </head>
 <body>
  <h1><%= h @title %></h1>
  <%= yield %>
 </body>
</html>

@@ index
<a href="/source">Source Code</a>
<a href="/runner?serialized_data=<%= h @serialized_greeter %>">Greeter</a>

@@ runner
<%= h @output %>

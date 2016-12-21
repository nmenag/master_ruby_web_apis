# hello_world/hello_world.rb
require 'ramaze'
class HelloWorld < Ramaze::Controller
  map '/hello_world'

  def index
    'Hello World!'
  end
end

Ramaze.start

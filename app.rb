require 'rack'
require 'json'
require 'byebug'
require 'thin'

app = Proc.new do |env|

  req = Rack::Request.new env
  # msg = JSON.parse env['rack.input'].gets
  p env['REQUEST_METHOD']
  p req.url

  [200, { 'Content-Type': 'application/json' }, ['Body'] ]
end

Rack::Handler::Thin.run(app, Port: 3011)

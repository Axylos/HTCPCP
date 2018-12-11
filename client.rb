require('tcp-client')

config = TCPClient::Configuration.create do |cfg|
  cfg.connect_timeout = 1
  cfg.write_timeout = 0.25
  cfg.read_timeout = 0.5
#  cfg.ssl_params = {ssl_version: :TLSv1_2}
end

url = 'localhost:3011'
TCPClient.open(url, config) do |client|
  pp client.write("BREW / HTTP/1.1\r\n\r\n")
  pp client.read 140
end

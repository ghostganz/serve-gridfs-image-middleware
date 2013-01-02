# This file is used by Rack-based servers to start the application.

$LOAD_PATH.unshift ::File.expand_path('../lib',  __FILE__)
require 'serve-gridfs-image-middleware'

require 'rubygems'
require 'mongoid'

Mongoid.load!(::File.expand_path('../mongoid.yml',  __FILE__))

use ServeGridfsImage

run lambda {|env| [200, {'Content-Type' => 'text/plain'}, ["hello"]]}

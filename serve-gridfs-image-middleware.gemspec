# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'serve-gridfs-image-middleware/version'

Gem::Specification.new do |s|
  s.name        = 'serve-gridfs-image-middleware'
  s.version     = ServeGridfsImageMiddleware::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Antek Piechnik', 'TV4', 'Anders Bengtsson']
  s.email       = ['ndrsbngtssn@yahoo.se']

  s.summary     = %q{Ruby on Rails Middleware for serving images from MongoDB GridFS}
  s.description = %q{Ruby on Rails 3.x Middleware for serving images from MongoDB GridFS. This is a packaging of Antek Piechnik's code from: http://antekpiechnik.com/posts/setting-up-carrierwave-file-uploads-using-gridfs-on-rails-3-and-mongoid}

  s.files       = Dir.glob("lib/**/*") + %w(Gemfile serve-gridfs-image-middleware.gemspec)

  s.add_runtime_dependency 'rails', '>= 3.0'
  s.add_runtime_dependency 'mongoid-grid_fs'
end

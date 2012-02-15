# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'serve-gridfs-image-middleware/version'

Gem::Specification.new do |s|
  s.name        = 'serve-gridfs-image-middleware'
  s.version     = ServeImageMiddleware::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Antek Piechnik', 'TV4', 'Anders Bengtsson']
  s.email       = ['per.astrom@tv4.se']

  s.summary     = %q{Ruby on Rails Middleware for serving images from MongoDB GridFS}
  s.description = %q{Ruby on Rails 3.x Middleware for serving images from MongoDB GridFS. Based on Antek Piechnik's guide: http://antekpiechnik.com/posts/setting-up-carrierwave-file-uploads-using-gridfs-on-rails-3-and-mongoid}

  s.files       = Dir.glob("lib/**/*") + %w(Gemfile gridfs-serve-image-middleware.gemspec LICENSE)

  s.add_runtime_dependency 'rails', '>= 3.1'
  s.add_runtime_dependency 'mongo'
end

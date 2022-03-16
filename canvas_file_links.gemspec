$:.push File.expand_path("../lib", __FILE__)

require "canvas_file_links/version"

Gem::Specification.new do |s|
  s.name        = "canvas_file_links"
  s.version     = CanvasFileLinks::Version
  s.authors     = ["Atomic Jolt", "Scott Phillips"]
  s.email       = ["scott.phillips@atomicjolt.com"]
  s.homepage    = "https://github.com/atomicjolt/canvas_file_links"
  s.summary     = "Enables files to be served statically, outside of the canvas chrome when using a local storage backend.  It is able to follow and reference relative paths to serve linked files."
  s.license     = "AGPL-3.0"
  s.extra_rdoc_files = ["README.md"]

  s.required_ruby_version = ">= 2.4"

  s.files = Dir["{app,config,lib}/**/*"]

  s.add_dependency "rails", ">= 5.0"
end


lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll/airtable_data/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-airtable_data"
  spec.version       = Jekyll::AirtableData::VERSION
  spec.date          = "2018-10-29"
  spec.summary       = "Airtable Data"
  spec.description   = "Jekyll plugin to pull down your Airtable tables as Datafiles (JSON) through Jekyll Commands"
  spec.authors       = ["Dan Klammer"]
  spec.homepage      = "https://github.com/danklammer/jekyll-airtable_data"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", "~> 3.8"
  spec.add_dependency "airtable"
  spec.add_dependency "bigdecimal"
  spec.add_dependency "activesupport"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"

end

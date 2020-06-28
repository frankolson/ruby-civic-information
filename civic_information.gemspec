
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "civic_information/version"

Gem::Specification.new do |spec|
  spec.name          = "civic_information"
  spec.version       = CivicInformation::VERSION
  spec.authors       = ["Will Olson"]
  spec.email         = ["will.olson11@gmail.com"]

  spec.summary       = "A ruby wrapper for the  Google Civic Information API"
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/frankolson/ruby-civic-information"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/frankolson/ruby-civic-information"
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 12.3", ">= 12.3.3"
  spec.add_development_dependency "minitest", "~> 5.14", ">= 5.14.1"
  spec.add_development_dependency "webmock", "~> 3.8", ">= 3.8.3"
  spec.add_development_dependency "sinatra", "~> 2.0", ">= 2.0.8"
  spec.add_development_dependency "byebug", "~> 11.1", ">= 11.1.3"

  spec.add_dependency "httparty", "0.18.0"
end

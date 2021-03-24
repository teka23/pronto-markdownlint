lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pronto/markdownlint/version"

Gem::Specification.new do |spec|
  spec.name          = "pronto-markdownlint"
  spec.version       = Pronto::MarkdownlintVersion::VERSION
  spec.authors       = ["Temuulen Enkhee"]
  spec.email         = ["temulen.mr@gmail.com"]

  spec.summary       = %q{Pronto runner for markdownlint}
  spec.homepage      = "https://github.com/teka23/pronto-markdownlint"
  spec.license       = "MIT"


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pronto"
end

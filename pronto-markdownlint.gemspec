require File.expand_path('lib/pronto/markdownlint/version', __dir__)

Gem::Specification.new do |spec|
  spec.name                  = 'pronto-markdownlint'
  spec.version               = Pronto::MarkdownlintVersion::VERSION
  spec.authors               = ['Temuulen Enkhee']
  spec.email                 = ['tem@circleci.com']
  spec.summary               = 'Pronto runner for markdownlint'
  spec.homepage              = 'https://github.com/teka23/pronto-markdownlint'
  spec.license               = 'MIT'
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.5.0'
  spec.add_dependency('pronto')
end

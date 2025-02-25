# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elastic/transport/version'

Gem::Specification.new do |s|
  s.name          = "elastic-transport"
  s.version       = Elastic::Transport::VERSION
  s.authors       = ['Karel Minarik', 'Emily Stolfo', 'Fernando Briano']
  s.email         = ['clients-team@elastic.co']
  s.summary       = 'Low level Ruby client for Elastic services.'
  s.homepage      = 'https://github.com/elastic/elastic-transport-ruby'
  s.license       = 'Apache-2.0'
  s.metadata = {
    'homepage_uri' => 'https://github.com/elastic/elastic-transport-ruby',
    'changelog_uri' => 'https://github.com/elastic/elastic-transport-ruby/blob/master/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/elastic/elastic-transport-ruby',
    'bug_tracker_uri' => 'https://github.com/elastic/elastic-transport-ruby/issues'
  }
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.extra_rdoc_files  = ['README.md', 'LICENSE']
  s.rdoc_options      = [ '--charset=UTF-8' ]

  s.required_ruby_version = '>= 2.5'

  s.add_dependency 'faraday', '< 3'
  s.add_dependency 'multi_json'

  # Faraday Adapters
  s.add_development_dependency 'manticore' if defined? JRUBY_VERSION
  s.add_development_dependency 'curb' unless defined? JRUBY_VERSION
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'cane'
  s.add_development_dependency 'hashie'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-reporters'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake', '~> 13'
  s.add_development_dependency 'require-prof' unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  s.add_development_dependency 'ruby-prof'    unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  s.add_development_dependency 'shoulda-context'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'test-unit', '~> 2'
  s.add_development_dependency 'yard'

  s.description = <<-DESC.gsub(/^    /, '')
    Low level Ruby client for Elastic. See the `elasticsearch` or `elastic-enterprise-search` gems for full integration.
  DESC
end

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-syntax/tasks/puppet-syntax'
require 'puppet_blacksmith/rake_tasks'


desc "Run syntax, lint, and spec tests."
task :test => [
	       :lint,
	       :validate,
	       :spec,
	      ]


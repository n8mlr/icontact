require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('icontact', '0.1.0') do |p|
  p.description       = "Interact with the iContact email subscription service."
  p.url               = "http://projects.urbaninfluence.com/gems"
  p.author            = "Nate Miller"
  p.email             = "nate@urbaninfluence.com"
  p.ignore_pattern    = ["tmp/*", "script/*"]
  p.development_dependencies = ['facets']
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
require 'yard'

YARD::Rake::YardocTask.new do |t|
  t.files   = ['app/**/*.rb']
end

Gem::Specification.new do |config|
  config.name = 'ninety_eight'
  config.version = '0.1.1'
  config.summary = 'The game of 98'
  config.description = "A computer genarated version of the card game 98. Comes with an executable with the actual game."
  config.author = "Zachary Perlmutter"
  config.email = 'zrp200@gmail.com'
  config.files = ['lib/ninety_eight.rb']
  config.homepage = 'https://rubygems.org/gems/ninety_eight'
  config.bindir = 'bin'
  config.executables << 'ninety_eight'
  config.test_files = ['.rspec', 'spec/spec_helper.rb', 'spec/98spec.rb']
  config.extra_rdoc_files = ['README.md']
end

# frozen_string_literal: true

require 'zeitwerk'

if ENV['DEBUG']
  require 'pry-byebug'
  require 'pry'
end

# Auto load all files in the project lib directory
loader = Zeitwerk::Loader.new
loader.ignore('lib/main.rb')
loader.push_dir('lib/app/controllers')
loader.push_dir('lib/app/parsers')
loader.push_dir('lib/app/services')
loader.push_dir('lib/app/validators')
loader.push_dir('lib/domain/entities')
loader.push_dir('lib/repositories')
loader.push_dir('lib/utils')
loader.setup # ready!

begin
  loader.eager_load(force: true)
rescue Zeitwerk::NameError => e
  puts e.message
else
end

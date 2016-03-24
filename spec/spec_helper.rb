$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter.new(
    [SimpleCov::Formatter::HTMLFormatter, CodeClimate::TestReporter::Formatter])
end

require 'speedflow/plugin/flowdock'

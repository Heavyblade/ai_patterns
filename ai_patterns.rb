require 'rubygems'
require 'bundler/setup'
require 'logger'
Bundler.require(:default)

Dir[File.join(__dir__, 'lib', '**', '*.rb')].each { |file| require file }


require 'simplecov'
SimpleCov.start 'rails'
SimpleCov.command_name "MiniTest"

Rails.env ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride" #just for kicks

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures  :all
end

def sign_in_as_admin
  visit root_path
  click_on "Log In"
  fill_in "Email", with: users(:admin).email
  fill_in "Password", with: "password"
  click_on "Sign in"
end

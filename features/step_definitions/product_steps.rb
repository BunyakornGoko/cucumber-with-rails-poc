require 'rspec/expectations'
require 'rspec/rails'

# Explicitly enable the :should syntax
RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
end

Given("I am on the products page") do
  visit products_path
end

When("I visit the products page") do
  visit products_path
end

Then("I should see a list of products") do
  page.should have_css("#products")
end

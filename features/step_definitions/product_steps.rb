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

Given("I am on the new product page") do
  visit new_product_path
end

When("I fill in {string} with {string}") do |field, value|
  case field
  when "Status"
    if value == "true"
      check field
    elsif value == "false"
      uncheck field
    end
  else
    fill_in field, with: value
  end
end

When("I click the {string} button") do |button_text|
  click_on button_text
end

Given("a product exists with name {string} and price {string}") do |name, price|
  # Assuming you have a Product model and ActiveRecord is set up
  # You might need to adjust this based on your actual model attributes
  @product = Product.create!(name: name, price: price)
end

Given("a product exists with name {string}") do |name|
  # Assuming you have a Product model and ActiveRecord is set up
  @product = Product.create!(name: name)
end

Given("a product exists with name {string} and status {string}") do |name, status_text|
  status = (status_text == "true") # Convert string "true" or "false" to boolean
  @product = Product.create!(name: name, status: status)
end

When("I am on the product details page for {string}") do |name|
  @product = Product.find_by!(name: name)
  visit product_path(@product)
end

Then("I should be on the product details page for {string}") do |name|
  @product = Product.find_by!(name: name)
  current_path.should == product_path(@product)
end

Then("I should see {string}") do |text|
  # This step needs to handle boolean status display, which might be text like "Yes" or "No".
  displayed_text = case text
                   when "true"
                     "Yes"
                   when "false"
                     "No"
                   else
                     text
                   end
  page.should have_content(displayed_text)
end

When("I confirm the deletion") do
  # This step is needed if your delete action uses a JavaScript confirmation dialog
  page.driver.browser.switch_to.alert.accept if page.driver.browser.present? && page.driver.browser.switch_to.alert.present?
end

Then("I should not see {string}") do |text|
  page.should have_no_content(text)
end

Then("I should be on the products page") do
  # Use have_current_path with a wait time to ensure the redirect has occurred
  page.should have_current_path(products_path, wait: 5)
end

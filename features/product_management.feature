Feature: Product Management
  As a user
  I want to manage products
  So that I can maintain the product catalog

  Background:
    Given I am on the products page

  Scenario: Viewing all products
    When I visit the products page
    Then I should see a list of products

  Scenario: Creating a new product
    Given I am on the new product page
    When I fill in "Name" with "New Product"
    And I fill in "Status" with "true"
    And I click the "Create Product" button
    Then I should be on the product details page for "New Product"
    And I should see "Product was successfully created."
    And I should see "New Product"
    And I should see "true"

  Scenario: Updating an existing product
    Given a product exists with name "Old Product" and status "false"
    And I am on the product details page for "Old Product"
    When I click the "Edit" button
    And I fill in "Name" with "Updated Product"
    And I fill in "Status" with "true"
    And I click the "Update Product" button
    Then I should be on the product details page for "Updated Product"
    And I should see "Product was successfully updated."
    And I should see "Updated Product"
    And I should see "true"

  @javascript
  Scenario: Deleting an existing product
    Given a product exists with name "Product to Delete"
    And I am on the product details page for "Product to Delete"
    When I click the "Destroy" button
    And I confirm the deletion
    Then I should be on the products page
    And I should see "Product was successfully destroyed."
    And I should not see "Product to Delete"

Feature: Product Management
  As a user
  I want to manage products
  So that I can maintain the product catalog

  Background:
    Given I am on the products page

  Scenario: Viewing all products
    When I visit the products page
    Then I should see a list of products

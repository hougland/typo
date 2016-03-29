Feature: Edit Category
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to edit categories for my blog posts

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    Given I am on the admin_categories page
    When I fill in "category_name" with "Cats"
    And I fill in "category_keywords" with "Lorem Ipsum"
    And I fill in "category_description" with "Lorem Ipsum"
    And I press "Save"

  Scenario:
    Given I am on the admin_categories page
    And I should see "Cats"
    When I follow "Cats"
    Then I should see "Lorem Ipsum"
    And I fill in "category_name" with "Cats Are Great"
    And I fill in "category_keywords" with "testing"
    And I fill in "category_description" with "lots of tests"
    And I press "Save"
    Then I should be on the new admin category page
    Then I should see "Cats Are Great"
    When I follow "Cats Are Great"
    Then I should see "lots of tests"

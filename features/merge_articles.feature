Feature: Merge Articles
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to merge similar articles

  Background:
    Given the blog is set up
    Given I am logged into the admin panel
    And I have an article named "Cats Are Great" by author "Ricky" with body "cats are so super" and with 1 comment
    And I have an article named "Why Cats Are Great" by author "Henry" with body "aren't can't so great" and with 1 comment

  Scenario: When admin user merges articles, only 1 article remains
    When I follow "All Articles"
    And I should see "Cats Are Great"
    And I should see "Why Cats Are Great"
    And I follow "Cats Are Great"
    And I fill in "article_id" with "4"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Cats Are Great"
    And I should not see "Why Cats Are Great"
    And I should see "Ricky"
    And I should not see "Henri"

  Scenario: When admin user merges articles, the comments are merged
    And I should see that feedback is the sum of both articles' feedback

  Scenario: When admin user merges articles, the articles' texts are merged
    When I follow "Cats Are Great"
    Then I should see "[text from one article]"
    And I should see "[text from the other article]"

  Scenario: Non-admin user can't merge articles
    Given I am logged in as a regular user, not admin
    Then there is no form to merge articles

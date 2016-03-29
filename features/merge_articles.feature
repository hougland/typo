Feature: Merge Articles
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to merge similar articles

  Background:
    Given the blog is set up
    And I have an article named "Cats Are Great" with 1 comment by author "Ricky"
    And I have an article named "Why Cats Are Great" with 1 comment by author "Henri"

  Scenario: Admin user can merge articles
    Given I am logged into the admin panel
    And I click "All Articles"
    And I click "[Article Title]"
    And I fill in "[field?]" with "[other article's id]"
    And I press "Merge"
    Then I should be on the [which page?]
    And I should see "[one of the article's titles]"
    And I should not see "[the other article's title]"
    And I should see that the author is one article's author
    And I should see that feedback is the sum of both articles' feedback
    When I follow "[merged article's title]"
    Then I should see "[text from one article]"
    And I should see "[text from the other article]"

  Scenario: Non-admin user can't merge articles
    Given I am logged in as a regular user, not admin
    Then there is no form to merge articles

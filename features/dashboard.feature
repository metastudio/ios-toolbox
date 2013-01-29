Feature: Dashboard
  As a visitor
  I want to see list of available projects grouped by category

  Background:
    Given I have categories:
      | Networking      |
      | Graphics        |
      | Social Networks |
      | Data Formats    |
    And I have projects:
      | Name            | Category   |
      | ASIHTTPRequest  | Networking |
      | RestKit         | Networking |
      | Cocos2d         | Graphics   |

  Scenario: View a list of available projects
    When I go to the dashboard page
    Then I should see next "Networking" projects:
      | ASIHTTPRequest |
      | RestKit        |
    And I should see next "Graphics" projects:
      | Cocos2d |

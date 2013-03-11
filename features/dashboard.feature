Feature: Dashboard
  As a visitor
  I want to see list of available projects grouped by category

  Background:
    Given I have categories:
      | Networking      |
      | Graphics        |
      | Social Networks |
      | Data Formats    |

  Scenario: View a list of available projects
    Given I have projects:
      | Name            | Category   |
      | ASIHTTPRequest  | Networking |
      | RestKit         | Networking |
      | Cocos2d         | Graphics   |
    When I go to the dashboard page
    Then I should see next "Networking" projects:
      | ASIHTTPRequest |
      | RestKit        |
    And I should see next "Graphics" projects:
      | Cocos2d |

  Scenario: More popular projects shown first
    Given I have projects:
      | Name            | Category   | Rating |
      | ASIHTTPRequest  | Networking | 10     |
      | RestKit         | Networking | 5      |
      | AFNetworking    | Networking | 50     |
    When I go to the dashboard page
    Then I should see next "Networking" projects in given order:
      | AFNetworking   |
      | ASIHTTPRequest |
      | RestKit        |

  Scenario: Project information is displayed
    Given I have projects:
      | Name            | Description  | Category   | URL                                    | Github Path            |
      | ASIHTTPRequest  | Nice project | Networking | http://allseeing-i.com/ASIHTTPRequest/ | pokeb/asi-http-request |
    When I go to the dashboard page
    Then I should see "ASIHTTPRequest"
    And I should see "Nice project"
    And I should see "http://allseeing-i.com/ASIHTTPRequest/"
    And I should see "https://github.com/pokeb/asi-http-request"

Feature: Project tagging
  Being administrator/moderator I would like to assign some tags to 
  the projects which I am adding/reviewing.

  Being site visitor I would like to have an ability to see tags associated 
  with project and to filter projects by clicking on some tag.

  Background:
    Given I have categories:
      | Networking      |
      | Graphics        |
    Given I have projects:
      | Name            | Category   |
      | ASIHTTPRequest  | Networking |
      | RestKit         | Networking |
      | Cocos2d         | Graphics   |

  Scenario: Tagging project
    Given I login as administrator
    When I add "networking" tag for "ASIHTTPRequest"
    And I add "http" tag for "ASIHTTPRequest"
    Then I should see tags associated with "ASIHTTPRequest":
      | networking |
      | http       |

  Scenario: List tagged projects
    Given the following projects tagged with "networking":
      | ASIHTTPRequest |
      | RestKit       |
    When I go to the "ASIHTTPRequest" project page
    And I click on "networking" tag
    Then I should see "ASIHTTPRequest"
    And I should see "RestKit"

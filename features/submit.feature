Feature: Submit project
  As a visitor
  In order to suggest a project for review
  I would like to submit a new project

  Scenario: Submit new project
    Given I have categories:
      | Networking      |
    When I submit the following project:
      | Name       | URL                  | Category   |
      | AwesomeKit | http://awesomekit.io | Networking |
    Then I should see a thankful message
    And there should be "AwesomeKit" project in moderation queue

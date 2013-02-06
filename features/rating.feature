Feature: Automatic rating
  The system should periodically update project rank based on number 
  of downloads / likes / forks. This information is fetched from the official
  GitHub repository using GitHub API.

  Background:
    Given I have categories:
      | Networking      |
    Given I have projects:
      | Name            | Category   | Github path             | Rating |
      | ASIHTTPRequest  | Networking | pokeb/asi-http-request  | 0      |
      | RestKit         | Networking | RestKit/RestKit         | 0      |

  @vcr
  Scenario: Updating rank information
    When I fetch new rating information for projects:
      | ASIHTTPRequest |
      | RestKit        |
    Then project "ASIHTTPRequest" should be ranked higher than "RestKit"

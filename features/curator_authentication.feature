Feature: Curators can edit all and only members in their department
  Curators should only be able to view and edit member information for
  their own departments
  So that member privacy is protected

  Background:
    Given I am logged in as a department curator

  Scenario: Curator tries to navigate to home page
    When I navigate to the home page
    Then I am redirected to my department dashboard
    And I see a flash notice letting me know that I can't go there

  Scenario: Curator can see their progress
    When I am on the dashboard
    Then I can see a proress bar telling me how many members are complete
    And Complete members are marked as green

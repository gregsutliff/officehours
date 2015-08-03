Feature: Organizers can search for active office hours by building

The ability to search for active office hours by location is a core feature of the app

  Background:
    Given I am logged in
    And I am an organizer

  Scenario: There are active office hours in the selected building
    Given I select a building
    And There are active office hours in the building
    Then The active office hours are displayed

  Scenario: There are no active office hours in the selected building
    Given I select a building
    And There are no active office hours in the building
    Then I am told that there are no office hours there right now

  Scenario: There are more than 20 office hours in selected building
    Given I select a building
    And There are more than 20 office hours in the building
    Then The results are paginated

 

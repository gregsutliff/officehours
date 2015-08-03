Feature: Render Home Page for only authorized users

The privacy of members is enhanced if faculty curators
are treated in accordance with the Law of Demeter.

  Background: I am logged in

  Scenario: I am an organizer
    When I visit the home page
    And I am an organizer             
    Then The Home Page will be rendered

  Scenario: I am a faculty curator
    When I visit the home page
    And I am a department curator
    Then I will be redirected to my department listing




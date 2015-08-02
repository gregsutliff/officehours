Feature: Render Home Page for only authorized users
  Users must be logged in in order to view the homepage

  Scenario: I am an organizer
    When I visit the home page
    And I am a regular user
    Then The Home Page will be rendered

  Scenario: I am a faculty curator
    When I visit the home page
    And I am a department curator
    Then I will be redirected to my department listing




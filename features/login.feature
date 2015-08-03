Feature: Users are redirected to role-specific pages on login

Given the authorization setup, it makes sense to dispatch 
users to specific starting pages based on their auth roles.

  Background: 
    Given I visit the login page
  
  Scenario: User is an organizer
    Given I log in as an organizer
    Then I am redirected to the home page

  Scenario: User is admin
    Given I log in as an administrator
    Then I am redirected to the admin dashboard

  Scenario: User is a department curator
    Given I log in as a department curator
    Then I am redirected to the department curation page

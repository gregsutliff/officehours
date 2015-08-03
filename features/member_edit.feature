Feature: Administrators can edit members
  As an administrator
  I want to be able to edit member information
  So that I can keep the database up to date

  Background:
    Given I am logged in as an administrator

  Scenario: Admin navigates to member dashboard
    Given I go to the admin dashboard
    Then I will see the full list of members
    And The list will be sortable by most columns

  Scenario: Admin updates member office 
    Given I go to the admin dashboard
    And I change the member's office number
    Then I will be asked to confirm the change
    And The member's information will be updated

  Scenario: Admin updates member office hours
    Given I go to the admin dashboard
    And I choose to edit a member's office hours
    Then The member's office hours will be presented in a form
    And I can edit existing hours
    And I can add new hours
    

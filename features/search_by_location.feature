Feature: Users can search for active office hours near their current location
  As an organizer
  I want to be able to search for active office hours near my current location
  So that I can quickly find members to talk to

  Background:
    Given I am logged in as an organizer
    And I am on the home page

  Scenario: I searh by current location
    Given I choose to search by my current location
    Then I am shown active office hours happening within 500 feet 
    And The results are sorted by time remaining

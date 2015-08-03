Feature: Administrators must approve all new user accounts
  As an administrator
  I want to approve all new user accounts
  So that I can protect member information and the integrity of the database

  Context: Someone creates an account with an email address that is not on the approved list
    When someone creates an account
    And their email address is not on the list of approved addresses
    Then admin gets an email

  Context: Someone creates an account with an email that is on the approved list
    When someone creates an account
    And their email is on the list of approved addresses
    Then their account is approved

Feature: This is my organization
  As a user
  So that I could be set as an admin of our organization
  I want to be able to request for the privilege through our organization page

  Background:
    Given the following users are registered:
    | email              | password       | admin | organization    | confirmed_at        |
    | nonadmin@myorg.com | mypassword1234 | false | My Organization | 2008-01-01 00:00:00 |

    And the following organizations exist:
    | name            | address        |
    | My Organization | 83 pinner road |

  Scenario: I am a guest user who signs up to be admin of my organization
    Given I am not signed in as any user
    When I am on the charity page for "My Organization"
    And I press "This is my organization"
    Then I should be on the sign in page

    #I can sign in or sign up from here
    
  Scenario: I am a signed in user who requests to be admin of my organization
    Given I am signed in as a non-admin
    When I am on the charity page for "My Organization"
    And I press "This is my organization"
    Then I should be on the charity page for "My Organization"
    And I should see ""
    

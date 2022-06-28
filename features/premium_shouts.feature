Feature: Premium account

  Background:
    Given the range is 100
    And people are located at
      | name     | Sean | Lucy |
      | location | 0    | 100  |

  Scenario: Test premium account features
    Given Sean has bought 30 credits
    When Sean shouts 3 messages containing the word "buy" 
    And Sean shouts 2 over-long messages                 
    Then Lucy hears all Sean's messages
    And Sean should have 11 credits
  Rule: Mention the word buy and lose 5 credits
    Scenario: Sean shouts messages containg the word "buy" 
        Given Sean has bought 30 credits
        When Sean shouts 3 messages containing the word "buy"         
        Then Lucy hears all Sean's messages
        And Sean should have 15 credits
  Rule: Over-long messages cost 2 credits
    Scenario: Sean shouts over-long messages
        Given Sean has bought 30 credits        
        When Sean shouts 2 over-long messages                 
        Then Lucy hears all Sean's messages
        And Sean should have 26 credits

#   @todo
#   Scenario: BUG #2789
#     Given Sean has bought 30 credits
#     When Sean shouts "buy, buy buy!"
#     Then Sean should have 25 credits
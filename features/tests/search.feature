Feature: Search Feature

  Background:
    Given open the homepage

  Scenario Outline: Filter and Validate Flight Departure Times Within a Specified Range
    And search for round-trip flights from "<from_where>" to "<to_where>"
    And select on "<departure_date>" with return on "<return_date>"
    And select <adult_count> adult,<child_count> child,<baby_count> baby and <cabin> class
    When filter departure times between "10:00" and "18:00"
    Then all listed flights should have departure times within "10:00" and "18:00"
    Examples:

      | from_where | to_where | departure_date | return_date | adult_count | child_count | baby_count | cabin    |
      | İstanbul   | Ankara   | 2025-02-22     | 2025-03-10  | 6           | 0           | 6          | Business |


  Scenario Outline: Verification of Turkish Airlines flight prices being sorted
    And search for round-trip flights from "<from_where>" to "<to_where>"
    And select on "<departure_date>" with return on "<return_date>"
    And select <adult_count> adult,<child_count> child,<baby_count> baby and <cabin> class
    When filter departure times between "10:00" and "18:00"
    Then the prices of Turkish Airlines flights should be displayed in increasing order
    Examples:

      | from_where | to_where | departure_date | return_date | adult_count | child_count | baby_count | cabin   |
      | İstanbul   | Ankara   | 2025-02-22     | 2025-03-11  | 1           | 2           | 1          | Economy |



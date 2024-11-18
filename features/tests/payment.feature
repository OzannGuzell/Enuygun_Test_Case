Feature: Payment Feature

  Scenario Outline: Selecting flight information and making the payment by the user
    Given open the homepage
    And search for round-trip flights from "<from_where>" to "<to_where>"
    And select on "<departure_date>" with return on "<return_date>"
    And select <adult_count> adult,<child_count> child,<baby_count> baby and <cabin> class
    And select flight item
    When fill in the information
    Then payment the flight

    Examples:
      | from_where | to_where | departure_date | return_date | adult_count | child_count | baby_count | cabin    |
      | İstanbul   | Ankara   | 2025-02-22     |             | 1           | 0           | 0          | Business |
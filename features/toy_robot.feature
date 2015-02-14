Feature: Toy Robot Simulator

  Scenario: Valid placement and movement
    Given a file named "example.txt" with:
    """
    PLACE 0,0,NORTH
    MOVE
    REPORT
    """
    When I run `toy_robot example.txt`
    Then the output should contain exactly:
    """
    0,1,NORTH

    """


  Scenario: Turning on spot
    Given a file named "example.txt" with:
    """
    PLACE 0,0,NORTH
    LEFT
    REPORT
    """
    When I run `toy_robot example.txt`
    Then the output should contain exactly:
    """
    0,0,WEST

    """


  Scenario: Several valid moves
    Given a file named "example.txt" with:
    """
    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT
    """
    When I run `toy_robot example.txt`
    Then the output should contain exactly:
    """
    3,3,NORTH

    """


Feature: Albums
  As a photographer I should have albums

  Scenario: list album
  Given the system knows about the following albums:
  | story         |
  | good time     |
  | too much rain |
  When the client requests a list of albums
  Then the response is a list containing two albums
  And one album contains the following attributes:
  | attribute | type   | value     |
  | story     | String | good time |
  And one album contains the following attributes:
  | attribute | type   | value         |
  | story     | String | too much rain |

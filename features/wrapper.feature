Feature: Create a wrapper

  So that I can control files executed by a program
  As a user of the program
  I want to create a wrapper in my search path

  Scenario: Wrapper creation
    Given my home directory is the current working directory
    And a directory named "bin"
    When I run `alternator wrap ruby ruby19`
    Then the exit status should be 0
    And the file "bin/ruby" must be executable
    And the file "bin/ruby" must contain exactly:
      """
      #!/usr/bin/env sh

      exec ruby19 $@

      """

Feature: Link to the rubygems executable directory for the ruby version
  requested

  So that I can control wich ruby version is used for gems executables
  As a developper using rubygems with many rubies
  I want a symlink to the rubygems executable directory for the ruby version of
  my choice to be created

  Scenario: Link to rubygems executable directory
    Given my home directory is the current working directory
    And a directory named ".gem/ruby/1.9/bin"
    When I run `alternator gem 1.9`
    Then the exit status should be 0
    Then the symlink ".alternator/gem_bin" must target ".gem/ruby/1.9/bin"

require 'minitest/spec'
require 'minitest/autorun'

require 'alternator'

class MiniTest::Spec < MiniTest::Unit::TestCase
  class << self
    alias :context  :describe
  end
end

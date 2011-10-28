module Alternator
  module Action
    attr_accessor :arguments

    def initialize(arguments)
      @arguments = arguments
    end
  end
end

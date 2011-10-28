module Alternator
  class CLI
    attr_accessor :arguments, :action

    def initialize(arguments)
      @arguments = arguments
    end

    def action
      @action ||= action_class_const.new action_arguments
    end

    def action_class_const
      Alternator::Actions.const_get(arguments.first.capitalize)
    end

    def action_arguments
      arguments.drop(1)
    end

    def run
      action.execute
    end
  end
end

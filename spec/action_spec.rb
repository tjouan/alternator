require 'spec_helper'

describe Alternator::Action do
  before do
    class Action
      include Alternator::Action
    end
  end

  let(:arguments) { ['some', 'arguments'] }
  let(:action)    { Action.new arguments }

  describe '#arguments' do
    it 'return the arguments' do
      action.arguments.must_equal arguments
    end
  end
end

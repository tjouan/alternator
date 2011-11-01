require 'spec_helper'

describe Alternator::CLI do
  let(:arguments) { ['action', 'some', 'arguments'] }
  let(:cli)       { Alternator::CLI.new arguments }

  before do
    module  Alternator
      module Actions
        class Action
          include Alternator::Action
        end
      end
    end
  end

  describe '#arguments' do
    it 'returns all the arguments' do
      cli.arguments.should == arguments
    end
  end

  describe '#action' do
    it 'returns the action instance' do
      cli.action.should be_an_instance_of Alternator::Actions::Action
    end

    it 'returns the action with action arguments assigned' do
      cli.action.arguments.should == cli.action_arguments
    end
  end

  describe '#action_class_const' do
    it 'returns the action class const, named after the first argument' do
      cli.action_class_const.should == Alternator::Actions::Action
    end
  end

  describe '#action_arguments' do
    it 'returns the action arguments' do
      cli.action_arguments.should == arguments.drop(1)
    end
  end

  describe '#run' do
    it 'sends :execute to the action' do
      action = mock 'Action'
      action.should_receive :execute
      cli.action = action
      cli.run
    end
  end
end

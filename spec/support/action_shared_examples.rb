shared_examples_for 'an action' do
  let(:arguments) { ['some', 'arguments'] }
  let(:action)    { described_class.new arguments }

  it 'is an action' do
    action.should be_kind_of Alternator::Action
  end

  describe '#arguments' do
    it 'returns the arguments' do
      action.arguments.should == arguments
    end
  end
end

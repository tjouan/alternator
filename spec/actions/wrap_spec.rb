require 'spec_helper'
require 'support/home_directory_helpers'

describe Alternator::Actions::Wrap do
  include HomeDirectoryHelpers

  let(:arguments) { ['ruby', 'ruby19'] }
  let(:action)    { Alternator::Actions::Wrap.new arguments }

  it 'is an action' do
    action.should be_kind_of Alternator::Action
  end

  describe '#filename' do
    it 'returns the first argument' do
      action.filename.should == arguments.first
    end
  end

  describe '#file_path' do
    it 'returns the path to the wrapper script' do
      action.file_path.should == "#{ENV['HOME']}/bin/#{action.filename}"
    end
  end

  describe '#target_binary' do
    it 'returns the second argument' do
      action.target_binary.should == arguments[1]
    end
  end

  describe '#execute' do
    around(:each) do |example|
      with_fake_home_directory do
        example.run
      end
    end

    it 'writes the wrapper script content' do
      action.execute
      File.read(action.file_path).should == <<-eoh
#!/usr/bin/env sh

exec ruby19 $@
      eoh
    end

    it 'makes the wrapper script executable' do
      action.execute
      File.executable?(action.file_path).should be_true
    end
  end
end

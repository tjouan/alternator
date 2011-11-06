require 'spec_helper'

describe Alternator::Actions::Gem do
  include HomeDirectoryHelpers

  it_behaves_like 'an action'

  let(:action) { Alternator::Actions::Gem.new ['1.9'] }

  describe '#rubygems_executable_directory' do
    it 'returns the rubygems executable directory' do
      action.rubygems_executable_directory.should ==
        "#{ENV['HOME']}/.gem/ruby/1.9/bin"
    end
  end

  describe '#execute' do
    around(:each) do |example|
      with_fake_home_directory do
        example.run
      end
    end

    context 'when ~/.alternator exists' do
      before do
        Dir.mkdir "#{ENV['HOME']}/.alternator"
      end

      it 'creates a symlink to the desired rubygems executable directory' do
        action.execute
        File.readlink("#{ENV['HOME']}/.alternator/gem_bin").should ==
          "#{ENV['HOME']}/.gem/ruby/1.9/bin"
      end
    end

    context 'when ~/.alternator does not exist' do
      it 'creates a symlink to the desired rubygems executable directory' do
        action.execute
        File.readlink("#{ENV['HOME']}/.alternator/gem_bin").should ==
          "#{ENV['HOME']}/.gem/ruby/1.9/bin"
      end
    end
  end
end

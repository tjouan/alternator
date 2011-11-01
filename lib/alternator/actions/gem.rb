module Alternator
  module Actions
    class Gem
      include Alternator::Action

      def rubygems_executable_directory
        "#{ENV['HOME']}/.gem/ruby/#{arguments.first}/bin"
      end

      def execute
        Dir.mkdir "#{ENV['HOME']}/.alternator" unless
          File.directory? "#{ENV['HOME']}/.alternator"
        File.symlink rubygems_executable_directory,
          "#{ENV['HOME']}/.alternator/gem_bin"
      end
    end
  end
end

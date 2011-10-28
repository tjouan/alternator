module Alternator
  module Actions
    class Wrap
      include Alternator::Action

      def filename
        @arguments.first
      end

      def file_path
        "#{ENV['HOME']}/bin/#{filename}"
      end

      def target_binary
        @arguments[1]
      end

      def execute
        File.open file_path, 'w', 0700 do |f|
          f.write <<-eoh
#!/usr/bin/env sh

exec #{target_binary} $@
          eoh
        end
      end
    end
  end
end

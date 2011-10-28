require 'tmpdir'

module HomeDirectoryHelpers
  def with_fake_home_directory
    Dir.mktmpdir do |tmp_directory|
      real_home_directory = ENV['HOME']
      ENV['HOME'] = tmp_directory
      # FIXME: should not create the bin directory, write a feature for
      # behavior when directory is missing.
      Dir.mkdir("#{ENV['HOME']}/bin")
      begin
        yield
      ensure
        ENV['HOME'] = real_home_directory
      end
    end
  end
end

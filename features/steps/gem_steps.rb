Then /^the symlink "([^"]*)" must target "([^"]*)"$/ do |symlink_path, target_path|
  prep_for_fs_check do
    File.readlink(symlink_path).should == "#{ENV['HOME']}/#{target_path}"
  end
end

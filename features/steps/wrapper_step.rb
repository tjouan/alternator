Then /^the file "([^"]*)" must be executable$/ do |file_path|
  prep_for_fs_check do
    File.executable?(file_path).should be_true
  end
end

Then /^the file "([^"]*)" must contain exactly:$/ do |file_path, file_content|
  Then %{the file "#{file_path}" should contain exactly:}, file_content
end

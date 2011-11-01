Given /^my home directory is the current working directory$/ do
  # Use aruba temporary directory for $HOME.
  ENV['HOME'] = File.expand_path current_dir
end

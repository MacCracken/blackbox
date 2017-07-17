desc "Cleanup of Results Folder"

task :clean_results do
  rm_rf "results"
end

task :default => :clean_results
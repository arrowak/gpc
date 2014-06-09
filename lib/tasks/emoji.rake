desc "Copy emoji to the Rails `public/images/emoji` directory"
task :emoji => :environment do
  require 'emoji'

  target = "#{Rake.original_dir}/public/images"
  `MkDir "#{target}"`
  `copy "#{Emoji.images_path}/emoji" "#{target}"`
end
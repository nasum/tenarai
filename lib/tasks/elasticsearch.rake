namespace :elasticsearch do
  desc 'create elasticsearch index'
  task :create_index => :environment do
    Article.create_index!
  end

  desc 'registration elasticsearch article'
  task :import_article => :environment do
    Article.import
  end
end

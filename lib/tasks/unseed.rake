namespace :db do
  desc "Remove seeded data"
  task unseed: :environment do
    puts "⚠️  This will delete ALL seeded data. Are you sure? (yes/no)"
    print "> "
    answer = STDIN.gets.chomp.strip.downcase
    puts

    if answer == "yes"
      ActionText::RichText.destroy_all
      Address.destroy_all
      Role.destroy_all
      User.destroy_all
      ServiceType.destroy_all
      Category.destroy_all
      CoverageZone.destroy_all
      City.destroy_all
      Country.destroy_all

      puts "✅ All data deleted."
    else
      puts "❌ Operation cancelled."
    end
  end
end

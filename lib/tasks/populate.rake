namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [City, Employee].each()
    
    City.populate 20 do |category|
      category.name = Populator.words(1..3).titleize
      Employee.populate 10..100 do |product|
        product.manager_id = category.id
         product.city_id = category.id
        product.name = Populator.words(1..5).titleize
      end
    end
  end
end
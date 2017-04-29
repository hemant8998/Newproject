namespace :db do
  desc "Change database"
  task :relocation_request => :environment do
    
    Employee.all.limit(10).each do |employee|
    	employee.willing_to_relocate = true
    	employee.save!
     	
    end
  end
end
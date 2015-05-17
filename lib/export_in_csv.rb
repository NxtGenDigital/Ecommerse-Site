require 'csv'
class ExportInCsv
	def self.csv
		filepath="#{Rails.root}/log/user_csv.csv"
        CSV.open(filepath,"a+") do |csv|
          csv << ["name","email","address"]
          User.all.each do |user|
            csv << [user.name,user.email,user.address]
          end
        end
	end
    def self.read_csv

         filepath="#{Rails.root}/log/user_csv.csv"
         first_row=true
         CSV.foreach(filepath) do |csv|
           if first_row
           	puts "Leaving First Column"
           	first_row =false
           else
               
               u=User.new(:name=>csv[0],:email=>csv[1],:address=>csv[2])
               u.save(:validate=>false)
               puts"Successfully Saved and id is #{u.id}"
           end
         end
    end
end

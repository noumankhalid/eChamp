# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

@roles = Role.find(:all)

@roles.each do|r|
  r.destroy
end
Role.new(:name => "Admin").save
Role.new(:name => "Customer").save
Role.new(:name => "Event Promoter").save
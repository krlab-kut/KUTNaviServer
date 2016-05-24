# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do |i|
  Information.create(:title => "info#{i}", :content => "content#{i}", :place => "place#{i}", :start_at => "2016-05-2#{i} 00:00:00")
end

Question.create(:user_id => 1, :parent_id => nil, :content => "Q1", :deleted => false)
Question.create(:user_id => 1, :parent_id => 1, :content => "Q2", :deleted => false)
Question.create(:user_id => 2, :parent_id => 1, :content => "Q3", :deleted => false)
Question.create(:user_id => 2, :parent_id => nil, :content => "Q4", :deleted => false)

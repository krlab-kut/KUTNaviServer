# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Dummy
=begin
3.times do |i|
  User.create(:place_id => "#{i}", :registration_id => "this-is-dummy-id#{i}")
end
3.times do |i|
  Information.create(:title => "dummy-info#{i}", :content => "this is dummy-info#{i}.")
end
3.times do |i|
  Event.create(:title => "dummy-event#{i}", :content => "this is dummy-event#{i}.", :place => "dummy-place#{i}", :start_at => "2016-07-17 0#{i}:00:00", :end_at => "2016-07-17 0#{i + 1}:00:00")
end
3.times do |i|
  q = Question.create(:user_id => nil, :title => "dummy-question#{i}", :content => "this is dummy-question#{i}")
  3.times do |j|
    Answer.create(:user_id => nil, :question_id => q.id, :content => "this is dummy-answer#{j}.")
  end
end
=end

#Event
=begin
Event.create(:title => "タイトル", :content => "A000でタイトルが開かれます。", :place => "A000", :start_at => "2016-07-31 00:00:00", :end_at => "2016-07-31 00:00:00")
=end

#Lab
=begin
Place.create(:name => "食堂", :counter => 0)
Place.create(:name => "清水研", :counter => 0)
Place.create(:name => "岩田研", :counter => 0)
Place.create(:name => "篠森研", :counter => 0)
Place.create(:name => "敷田研", :counter => 0)
Place.create(:name => "中原研", :counter => 0)
Place.create(:name => "濱村研", :counter => 0)
Place.create(:name => "福本研", :counter => 0)
Place.create(:name => "横山研", :counter => 0)
Place.create(:name => "任研", :counter => 0)
Place.create(:name => "鵜川研", :counter => 0)
Place.create(:name => "門田研", :counter => 0)
Place.create(:name => "栗原研", :counter => 0)
Place.create(:name => "繁桝研", :counter => 0)
Place.create(:name => "高田研", :counter => 0)
Place.create(:name => "松崎研", :counter => 0)
Place.create(:name => "妻鳥研", :counter => 0)
Place.create(:name => "吉田研", :counter => 0)
Place.create(:name => "植田研", :counter => 0)
=end

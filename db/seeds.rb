# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

Event.create(:title => "KUTガイダンス", :content => "C102でKUTガイダンスが開かれます。", :place => "C102", :start_at => "2016-07-17 01:20:00", :end_at => "2016-07-17 01:50:00")
Event.create(:title => "スタディスキルズって？1", :content => "「スタディスキルズって？」が、B棟104教室で開かれます。", :place => "B104", :start_at => "2016-07-17 01:00:00", :end_at => "2016-07-17 02:00:00")
Event.create(:title => "スタディスキルズって？2", :content => "「スタディスキルズって？」が、B棟104教室で開かれます。", :place => "B104", :start_at => "2016-07-17 04:30:00", :end_at => "2016-07-17 05:00:00")
Event.create(:title => "ものづくり工房公開", :content => "「ものづくり工房公開」が、A棟106l教室北側で開かれます。", :place => "A106北側", :start_at => "2016-07-17 01:00:00", :end_at => "2016-07-17 07:00:00")
Event.create(:title => "情報学群説明会", :content => "「情報学群説明会(情報通信技術者を目指す諸君へ)」が、A棟106教室で開かれます。", :place => "A106", :start_at => "2016-07-17 02:40:00", :end_at => "2016-07-17 03:20:00")
Event.create(:title => "体験授業：情報通信の未来", :content => "体験授業：「情報通信の未来～人にやさしいコミュニケーション～」が、A棟106教室で開かれます。", :place => "A106", :start_at => "2016-07-17 04:00:00", :end_at => "2016-07-17 04:40:00")
Event.create(:title => "体験授業：リアルとバーチャルの境界", :content => "体験授業：「リアルとバーチャルの境界～計測が切り拓くバーチャルフロンティア～」が、A棟106教室で開かれます。", :place => "A106", :start_at => "2016-07-17 05:00:00", :end_at => "2016-07-17 05:40:00")
Event.create(:title => "MRIで人の脳を覗いてみよう1", :content => "「MRIで人の脳を覗いてみよう」が、A棟155教室でが開かれます。", :place => "", :start_at => "2016-07-17 01:00:00", :end_at => "2016-07-17 01:30:00")
Event.create(:title => "MRIで人の脳を覗いてみよう2", :content => "「MRIで人の脳を覗いてみよう」が、A棟155教室でが開かれます。", :place => "", :start_at => "2016-07-17 02:00:00", :end_at => "2016-07-17 02:30:00")
Event.create(:title => "MRIで人の脳を覗いてみよう3", :content => "「MRIで人の脳を覗いてみよう」が、A棟155教室でが開かれます。", :place => "", :start_at => "2016-07-17 03:00:00", :end_at => "2016-07-17 03:30:00")
Event.create(:title => "MRIで人の脳を覗いてみよう4", :content => "「MRIで人の脳を覗いてみよう」が、A棟155教室でが開かれます。", :place => "", :start_at => "2016-07-17 04:00:00", :end_at => "2016-07-17 04:30:00")
Event.create(:title => "MRIで人の脳を覗いてみよう5", :content => "「MRIで人の脳を覗いてみよう」が、A棟155教室でが開かれます。", :place => "", :start_at => "2016-07-17 05:00:00", :end_at => "2016-07-17 05:30:00")

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

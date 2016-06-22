# ["Ruby", "JavaScript", "HTML", "CSS"].each do |cat|
#   Category.create name: cat
# end
50.times do
  Snippet.create title: Faker::Lorem.word,
                work: Faker::Lorem.sentence,
                category_id: 1 + rand(4)
end

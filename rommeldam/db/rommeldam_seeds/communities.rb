section "Communities maken" do
  Proposal.find_each { |proposal| proposal.update(community: Community.create) }
  Budget::Investment.find_each { |investment| investment.update(community: Community.create) }
end

section "Onderwerpen in communities plaatsen" do
  Community.find_each do |community|
    Topic.create(community: community, author: User.all.sample,
                 title: Faker::Lorem.sentence(3).truncate(60), description: Faker::Lorem.sentence)
  end
end

section "Reacties op onderwerpen van communities plaatsen" do
  30.times do
    author = User.all.sample
    topic = Topic.all.sample
    Comment.create!(user: author,
                    created_at: rand(topic.created_at..Time.current),
                    commentable: topic,
                    body: Faker::Lorem.sentence)
  end
end

Message.destroy_all
Participant.destroy_all
Bid.destroy_all
Review.destroy_all
Skill.destroy_all
Listing.destroy_all
Conversation.destroy_all
User.destroy_all

leo = User.create(:username => "Leo", :password => "password")
ralph = User.create(:username => "Ralph", :password => "password")
mikey = User.create(:username => "Mikey", :password => "password")
donnie = User.create(:username => "Donnie", :password => "password")

job = Listing.create(:title => "job", :description => "A job", user:leo)
remodel = Listing.create(:title => "remodel", :description => "Another job", user:ralph)
kitchen = Listing.create(:title => "kithen", :description => "Kithcen remodel", user:ralph)
bathroom = Listing.create(:title => "bathroom", :description => "Bathroom remodel", user:mikey)
lighttech = Listing.create(:title => "lighting tech", :description => "Need an audio engineer for our gig", user:mikey)
driver = Listing.create(:title => "driver", :description => "Looking for a driver for the evening", user:donnie)
caterer = Listing.create(:title => "caterer", :description => "We need our wedding caterer", user:donnie)
roofer = Listing.create(:title => "roofer", :description => "Looking for a good roofer to replace a roof", user:leo)
sound = Listing.create(:title => "audio engineer", :description => "Need an audio engineer for our album", user:ralph)

Bid.create(:amount => 900, :message => "I'll do a great job!", user:mikey, listing:job)
Bid.create(:amount => 400, :message => "You can't beat this offer!", user:donnie, listing:job)
Bid.create(:amount => 1200, :message => "Have you seen my other work?", user:ralph, listing:job)
Bid.create(:amount => 700, :message => "How soon do you need it done?", user:mikey, listing:remodel)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:donnie, listing:remodel)
Bid.create(:amount => 900, :message => "I'll do a great job!", user:mikey, listing:kitchen)
Bid.create(:amount => 400, :message => "You can't beat this offer!", user:donnie, listing:kitchen)
Bid.create(:amount => 1200, :message => "Have you seen my other work?", user:leo, listing:kitchen)
Bid.create(:amount => 700, :message => "How soon do you need it done?", user:leo, listing:bathroom)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:donnie, listing:bathroom)
Bid.create(:amount => 900, :message => "I'll do a great job!", user:leo, listing:lighttech)
Bid.create(:amount => 400, :message => "You can't beat this offer!", user:donnie, listing:lighttech)
Bid.create(:amount => 1200, :message => "Have you seen my other work?", user:ralph, listing:lighttech)
Bid.create(:amount => 700, :message => "How soon do you need it done?", user:mikey, listing:driver)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:leo, listing:driver)
Bid.create(:amount => 700, :message => "How soon do you need it done?", user:mikey, listing:caterer)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:leo, listing:caterer)
Bid.create(:amount => 900, :message => "I'll do a great job!", user:mikey, listing:roofer)
Bid.create(:amount => 400, :message => "You can't beat this offer!", user:donnie, listing:roofer)
Bid.create(:amount => 1200, :message => "Have you seen my other work?", user:ralph, listing:roofer)
Bid.create(:amount => 700, :message => "How soon do you need it done?", user:mikey, listing:sound)
Bid.create(:amount => 1000, :message => "I can start tomorrow.", user:donnie, listing:sound)

roofer = Skill.create(:name => "Roofer")
roofer.reviews.build(user:mikey, :author => "Leo", :comment => "Mikey is a great roofer!")
roofer.save
plumber = Skill.create(:name => "Plumber")
plumber.reviews.build(user:leo, :author => "Ralph", :comment => "Leo is a great plumber!")
plumber.save
electrician = Skill.create(:name => "Electrician")
electrician.reviews.build(user:donnie, :author => "Mikey", :comment => "Donnie is a great electrician!")
electrician.save
builder = Skill.create(:name => "Builder")
builder.reviews.build(user:ralph, :author => "Donnie", :comment => "Ralph is a great builder!")
builder.save
carpenter = Skill.create(:name => "Carpenter")
carpenter.reviews.build(user:mikey, :author => "Ralph", :comment => "Mikey is a great carpenter")
carpenter.save
musician = Skill.create(:name => "Musician")
musician.reviews.build(user:leo, :author => "Donnie", :comment => "Leo is a great musician")
musician.save
photographer = Skill.create(:name => "Photographer")
photographer.reviews.build(user:donnie, :author => "Mikey", :comment => "Donnie is a great photographer")
photographer.save
chauffeur = Skill.create(:name => "Chauffeur")
chauffeur.reviews.build(user:ralph, :author => "Leo", :comment => "Ralph is a great chauffeur")
chauffeur.save

a = Conversation.create
Participant.create(user:leo, conversation:a)
Participant.create(user:ralph, conversation:a)
Message.create(:message => "Hey can you do this job?", :sender => "Leo", conversation:a)
Message.create(:message => "Sure cabn!", :sender => "Ralph", conversation:a)
Message.create(:message => "Thank you.", :sender => "Leo", conversation:a)

b = Conversation.create
Participant.create(user:leo, conversation:b)
Participant.create(user:mikey, conversation:b)
Message.create(:message => "Hey can you do this job?", :sender => "Leo", conversation:b)
Message.create(:message => "Sure cabn!", :sender => "Mikey", conversation:b)
Message.create(:message => "Thank you.", :sender => "Leo", conversation:b)

c = Conversation.create
Participant.create(user:leo, conversation:c)
Participant.create(user:donnie, conversation:c)
Message.create(:message => "Hey can you do this job?", :sender => "Leo", conversation:c)
Message.create(:message => "Sure cabn!", :sender => "Donnie", conversation:c)
Message.create(:message => "Thank you.", :sender => "Leo", conversation:c)

d = Conversation.create
Participant.create(user:ralph, conversation:d)
Participant.create(user:mikey, conversation:d)
Message.create(:message => "Hey can you do this job?", :sender => "Mikey", conversation:d)
Message.create(:message => "Sure cabn!", :sender => "Ralph", conversation:d)
Message.create(:message => "Thank you.", :sender => "Mikey", conversation:d)

e = Conversation.create
Participant.create(user:ralph, conversation:e)
Participant.create(user:donnie, conversation:e)
Message.create(:message => "Hey can you do this job?", :sender => "Donnie", conversation:e)
Message.create(:message => "Sure cabn!", :sender => "Ralph", conversation:e)
Message.create(:message => "Thank you.", :sender => "Donnie", conversation:e)

f = Conversation.create
Participant.create(user:mikey, conversation:f)
Participant.create(user:donnie, conversation:f)
Message.create(:message => "Hey can you do this job?", :sender => "Mikey", conversation:f)
Message.create(:message => "Sure cabn!", :sender => "Donnie", conversation:f)
Message.create(:message => "Thank you.", :sender => "Mikey", conversation:f)



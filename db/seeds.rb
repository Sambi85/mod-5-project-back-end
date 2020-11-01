require 'faker'
require 'pexels'
require 'dotenv'
Dotenv.load

client = Pexels::Client.new(ENV['PEXELS_API_KEY'])

User.destroy_all
Post.destroy_all    
Comment.destroy_all
Reply.destroy_all
Like.destroy_all
Follow.destroy_all

repliesArray = ["wow","So cool", "Great Comment, I totally agree !", "That's what she said !!!", "Bruh, great comment", "YES YES YES YES !!!!", "c'mon I was gonna say that !"]
commentsArray = ["Nice shoot, what are you a pro?","Where are you right now, I love this !","Guess whose my new best friend ?"," Smoking ;)", "I feel like there's a perfect movie reference that will go with this... I'm spacing XD","Just smashed the like button like a billion times !"]
catDesArray = ["This is my cat Princess, careful her nails are sharp","He looks cute, but he keeps me up all night", "How do you not love that face", "Name a prettier kitty, I dare you !", "Meow Meow !", "Just got him yesterday, so in love right now !"]
pizzaDesArray = ["Cheesy goodness","This is my self care, right here !!!","Perfect Food !","Don't tell my GF, She's a vegan and she's pushy...","Bruh, Look at this zaaahhh","PIZZA TIME","Can you say cheat day ?"]
carDesArray = ["VVRoOOOOOOoommmmm!!!!!","Dream ride right there","Yeah I would totally, but my wife would kill me...","OOOOHHHHH YEAHHHH!","How do you not like this, it's a crime!","Come on Bro, That's insane", "YAAAAAAAASSSSSSSSS!!!!!"]
tacoDesArray = ["AYE LOS TACOS XD","I've seen better, do you know about that taco truck on bushwich ave. ?","Those are fake, I've could see that from a mile way","I can;t even handle this taco-ness right now","BRUH, I'm vegan, but nice try!","@_@"]
artDesArray = ["Art is for smarts!","This is so crazy, I love it!","Ewwwww.... so gross","It reminds me of a chicken dinner.... or maybe I'm just hungry right now :P","How much, I'll pay in cash right now !","Incredible!"]
spaceDesArray = ["THE FINAL FRONTIER... or something like that","Spaceballs....","So crazy, space is so endless, makes you feel so small...","Yeah I don't envy astronauts, they can have that job...","So pretty"]
beerDesArray = ["CHUG CHUG CHUG!","I'm actually more of a wine drinker...","Look at the head on that","Is that an IPA, that's all I really drink","Dude Looks just like my homebrew, pretty sweet","So jealous, just went on a diet..."]
cocktailDesArray = ["Ooooooo looks good","How much for 12, seriously","Yummy!!!","Happy Hour just started !","Is there rum in that or vodka ?","I like Mojitos, do you have any pictures of those ?"]
halloweenDesArray = ["BOOOOOOO","Yeah that's a lame costume, sorry not sorry","Nice job, how long did that take ?","Dude, I just wore that last year!","Super Cool Costume ??!"]


client.photos.search('portraits', per_page: 10).photos.each do |photo|
    user = User.create(username: Faker::Name.name , password:"123", quote: Faker::GreekPhilosophers.quote , avatar: photo.src.values[7])
end

client.photos.search('Cats', per_page: 5).photos.each do |photo|
   post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: catDesArray.uniq.sample , date: Faker::Time.backward(days: 14, period: :evening))
end

client.photos.search('Pizza', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: pizzaDesArray.uniq.sample , date: Faker::Time.backward(days: 14, period: :evening))
 end

 client.photos.search('Cars', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: carDesArray.uniq.sample, date: Faker::Time.backward(days: 14, period: :evening))
 end

 client.photos.search('Tacos', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: tacoDesArray.uniq.sample, date: Faker::Time.backward(days: 14, period: :evening))
 end

 client.photos.search('Art', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: artDesArray.uniq.sample, date: Faker::Time.backward(days: 14, period: :evening))
 end

 client.photos.search('Space', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: spaceDesArray.uniq.sample, date: Faker::Time.backward(days: 14, period: :evening))
 end

 client.photos.search('Beer', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: beerDesArray.uniq.sample, date: Faker::Time.backward(days: 14, period: :evening))
 end

 client.photos.search('Cocktails', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: cocktailDesArray.uniq.sample, date: Faker::Time.backward(days: 14, period: :evening))
 end

 client.photos.search('Halloween', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: halloweenDesArray.uniq.sample, date: Faker::Time.backward(days: 14, period: :evening))
 end

5.times {
    Comment.create(user_id: User.all.uniq.sample.id, post_id: Post.all.uniq.sample.id, description: commentsArray.uniq.sample, date: Faker::Time.backward(days: 14, period: :evening))
}

5.times {
    Like.create(user_id: User.all.uniq.sample.id, post_id: Post.all.uniq.sample.id, counter: Faker::Number.number(digits: 2), date: Faker::Time.backward(days: 14, period: :evening))
}

5.times {
    Reply.create(user_id: User.all.uniq.sample.id, comment_id: Comment.all.uniq.sample.id, description: repliesArray.uniq.sample, date: Faker::Time.backward(days: 14, period: :evening))
}

10.times {
    Follow.create(leader_id: User.all.uniq.sample.id, follower_id: User.all.uniq.sample.id, date: Faker::Time.backward(days: 14, period: :evening))
}

Follow.create(leader_id: 1, follower_id: 1, date: Faker::Time.backward(days: 14, period: :evening))
Follow.create(leader_id: 1, follower_id: 2, date: Faker::Time.backward(days: 14, period: :evening))
Follow.create(leader_id: 1, follower_id: 3, date: Faker::Time.backward(days: 14, period: :evening))
Follow.create(leader_id: 1, follower_id: 4, date: Faker::Time.backward(days: 14, period: :evening))
Follow.create(leader_id: 1, follower_id: 5, date: Faker::Time.backward(days: 14, period: :evening))
Follow.create(leader_id: 1, follower_id: 6, date: Faker::Time.backward(days: 14, period: :evening))
Follow.create(leader_id: 1, follower_id: 7, date: Faker::Time.backward(days: 14, period: :evening))
Follow.create(leader_id: 1, follower_id: 8, date: Faker::Time.backward(days: 14, period: :evening))
# Follow.create(leader_id: 2, follower_id: 3, date: Faker::Time.backward(days: 14, period: :evening))

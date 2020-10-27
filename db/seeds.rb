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

client.photos.search('portraits', per_page: 10).photos.each do |photo|
    user = User.create(username: Faker::Name.name , password:"123", quote: Faker::GreekPhilosophers.quote , avatar: photo.src.values[7])
end

client.photos.search('Cats', per_page: 5).photos.each do |photo|
   post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: Faker::Lorem.sentence, date: Time.now)
end

client.photos.search('Pizza', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: Faker::Lorem.sentence, date: Time.now)
 end

 client.photos.search('Cars', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: Faker::Lorem.sentence, date: Time.now)
 end

 client.photos.search('Tacos', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: Faker::Lorem.sentence, date: Time.now)
 end

 client.photos.search('Art', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: Faker::Lorem.sentence, date: Time.now)
 end

 client.photos.search('Space', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: Faker::Lorem.sentence, date: Time.now)
 end

 client.photos.search('Beer', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: Faker::Lorem.sentence, date: Time.now)
 end

 client.photos.search('Cocktails', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: Faker::Lorem.sentence, date: Time.now)
 end

 client.photos.search('Halloween', per_page: 5).photos.each do |photo|
    post = Post.create(user_id: User.all.sample.id, img: photo.src.values[2], description: Faker::Lorem.sentence, date: Time.now)
 end

5.times {
    Comment.create(user_id: User.all.uniq.sample.id, post_id: Post.all.uniq.sample.id, description: Faker::Lorem.sentence, date: Time.now)
}

5.times {
    Like.create(user_id: User.all.uniq.sample.id, post_id: Post.all.uniq.sample.id, counter: Faker::Number.number(digits: 2), date: Time.now)
}

5.times {
    Reply.create(user_id: User.all.uniq.sample.id, comment_id: Comment.all.uniq.sample.id, description: Faker::ChuckNorris.fact, date: Time.now)
}

10.times {
    Follow.create(leader_id: User.all.uniq.sample.id, follower_id: User.all.uniq.sample.id, date: Time.now)
}

Follow.create(leader_id: 1, follower_id: 1, date: Time.now)
Follow.create(leader_id: 1, follower_id: 2, date: Time.now)
Follow.create(leader_id: 1, follower_id: 3, date: Time.now)
Follow.create(leader_id: 1, follower_id: 4, date: Time.now)
Follow.create(leader_id: 1, follower_id: 5, date: Time.now)
Follow.create(leader_id: 1, follower_id: 6, date: Time.now)
Follow.create(leader_id: 1, follower_id: 7, date: Time.now)
Follow.create(leader_id: 1, follower_id: 8, date: Time.now)
# Follow.create(leader_id: 2, follower_id: 3, date: Time.now)

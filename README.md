# mod-5-project-back-end
Title: Instagrahams server side
Concept: Social Media site inspired by instagram.

Code editor:
1. Vscode https://code.visualstudio.com/

Technologies:
1. Ruby on Rails https://rubyonrails.org/
2. Pexel API for photos https://www.pexels.com/
3. Faker Gem for seed data https://github.com/faker-ruby/faker 
3. Serializers with active model https://github.com/rails-api/active_model_serializers
4. debugging with pry https://github.com/pry/pry
5. protected API KEY with dotenv https://github.com/bkeepers/dotenv

Authentication:
1. Rails BCrypt gem https://github.com/codahale/bcrypt-ruby
2. JWT gem https://github.com/jwt/ruby-jwt

Gems:
- gem 'faker'
- gem 'pexels', '~> 0.0.4'
- gem 'dotenv'
- gem 'dotenv-rails'
- gem 'active_model_serializers', '0.10.10'
- gem 'pry'
- gem "jwt", "~> 2.2"

Stretch Goals:
1. CSS Styling
2. Authentication

Future Goals:
1. Direct Chat w/ action cable
2. Save posts feature
3. Rebuild Front-end utilizing Redux https://redux.js.org/

User Stories:
1. User can create or update their account with an avatar, quote, password and username
2. User can create a post with photo & initial comment
3. User can read their photos, their initial comment, and date posted
4. User can delete or update their posts, comments and replies
5. User can  ONLY delete comments or replies on their page
6. User can read other Users’ comments, replies, and likes for their photos
7. User can reply to a comment by another User 
8. User can create a comment & reply on their own photo
9. User can read other Users’ posts, followers, comments, replies, other users likes
10. User can like other Users’ posts, comments, replies
11. User can read their avatar and quote
12. User can read the avatar and quote of other users
13. User can follow or un-follow another User

Models:
1. User: Has many Posts, Comments, Replies
2. Post: Has many Users, Comments
3. Follows: Belongs to User #1, Belongs to User #2
4. Comments: belongs to User, belongs to Post, Has many replies 
5. Replies: belongs to Comments, belongs to User
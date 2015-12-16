# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create some users
    User.create(name:'joe bloggs', email:'jb@here.com', password: "secret", password_confirmation: "secret")
    User.create(name:'joe Cloggs', email:'jc@here.com', password: "secret", password_confirmation: "secret")
    User.create(name:'jim smith', email:'js@here.com', password: "secret", password_confirmation: "secret")

# Associate some microposts with users
    user = User.find(1)
    user.microposts.create(content: "Hello!", picture: 'pet1.png')
    user.microposts.create(content: "Welcome!", picture: 'pet1.png')
    user = User.find(2)
    user.microposts.create(content: "Hi!", picture: 'pet2.png')
    user = User.find(3)
    user.microposts.create(content: "Happy day with my dog!", picture: 'pet3.png')

# Associate some pets with users
    user = User.find(1)
    user.pets.create(nickname: "Lucy", age: '0 - 3 months', gender:'1', breeds:'Beagle', city:'Carlow', image_file_name:'pet1.png', image_content_type:'image/png',image_file_size:'20703')    
    user = User.find(2)
    user.pets.create(nickname: "Tom", age: '0 - 3 months', gender:'0', breeds:'Box', city:'Waterford', image_file_name:'pet2.png', image_content_type:'image/png',image_file_size:'20703')
    user = User.find(3)
    user.pets.create(nickname: "Jerry", age: '0 - 3 months', gender:'1', breeds:'Others', city:'Wexford', image_file_name:'pet3.png', image_content_type:'image/png',image_file_size:'20703')

# Create search
   Search.create(age: '0 - 3 months', gender:'1', breeds:'Beagle')
   Search.create(age: '0 - 3 months', gender:'0', breeds:'Box')
   Search.create(age: '0 - 3 months', gender:'1', breeds:'Others')

# Create some comments
   user = User.find(1)
   pet = Pet.find(2) 
   pet.comments.create(body: 'Hi!',user_id: '1')

   user = User.find(2)
   pet = Pet.find(3) 
   pet.comments.create(body: 'Hi!',user_id: '2')
   
   user = User.find(4)
   pet = Pet.find(4) 
   pet.comments.create(body: 'Hi!',user_id: '4')

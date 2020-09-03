# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

CatPicture.destroy_all
Role.destroy_all

    CatPicture.create(title: "J'ai faiiiiim",  
     description:Faker::GreekPhilosophers.quote, 
     price:rand(10..60),
     image_url: "https://cdn.radiofrance.fr/s3/cruiser-production/2018/12/9f19b228-269f-4995-ba7f-eda054945811/1136_gettyimages-155607257.jpg")


     CatPicture.create(title: "Chut, on dort!",  

     description:Faker::GreekPhilosophers.quote, 
     price:rand(10..60),
     image_url: "https://www.zoomalia.com/blogz/1608/adorable-animal-blanket-2722990.jpg")


     CatPicture.create(title: "Saluuuut!",  

     description:Faker::GreekPhilosophers.quote, 
     price:rand(10..60),
     image_url: "https://ds1.static.rtbf.be/article/image/1240x800/b/8/f/7e8d000bb5fc97185ab4e4b83de7208f-1526644288.png")



     CatPicture.create(title: "Ca baille",  

     description:Faker::GreekPhilosophers.quote, 
     price:rand(10..60),
     image_url: "https://i.pinimg.com/originals/4b/f6/86/4bf68667464e94d66d54af01a6e1141b.jpg")



     CatPicture.create(title: "Tic et Tac",  

     description:Faker::GreekPhilosophers.quote, 
     price:rand(10..60),
     image_url: "https://i.pinimg.com/564x/ec/b2/c6/ecb2c6e92ba1b6d7fe9e895fbc463381.jpg")



     CatPicture.create(title: "Chat and Chill",  

     description:Faker::GreekPhilosophers.quote, 
     price:rand(10..60),
     image_url: "https://i.pinimg.com/originals/96/5f/d7/965fd7d6b859c409a5aed1063de2f833.jpg")


     CatPicture.create(title: "Bébé chat",  

     description:Faker::GreekPhilosophers.quote, 
     price:rand(10..60),
     image_url: "https://www.pattesetmoustaches.com/wp-content/uploads/2016/06/chat-trop-mignion.jpg")


     CatPicture.create(title: "Les 6 mousquetaires",  

     description:Faker::GreekPhilosophers.quote, 
     price:rand(10..60),
     image_url: "https://i.pinimg.com/originals/8b/02/d4/8b02d48a697200e2f6d60efcfd42f74c.jpg")

     Role.create(title:"admin", description:"pour les admins")














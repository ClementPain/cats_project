class UserMailer < ApplicationMailer
    default from: 'kittyswall@gmail.com'

    def welcome_email(user)
        @user = user      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @url  = 'https://catsproject33.herokuapp.com/'       #on définit une variable @url qu'on utilisera dans la view d’e-mail     
        mail(to: @user.email, 
        subject: "Bienvenue chez les Chat's !")       # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.  
        
    end
end

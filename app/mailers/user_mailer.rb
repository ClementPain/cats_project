class UserMailer < ApplicationMailer
    default from: 'kittyswall@gmail.com'

    def welcome_email(user)
        @user = user      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @url  = 'https://catsproject33.herokuapp.com/users/sign_in'       #on définit une variable @url qu'on utilisera dans la view d’e-mail     
        mail(to: @user.email, 
        subject: "Bienvenue chez les Chat's !")       # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.   
    end

    def order_confirmation_email(order)
        @order = order
        @user = order.user
        @url = 'https://catsproject33.herokuapp.com/users/sign_in' 
        mail(to: @user.email, subject: "Votre commande n°#{@order.id} Kitty's Wall")
    end

    def order_notice_email(order)
        @order = order
        @user = order.user
        @url = 'https://catsproject33.herokuapp.com/users/sign_in'
        
        @admin = []
        User.all.each do |user|
            @admin << user if user.roles.include?(Role.find_by(title:"admin"))
        end

        @admin.each do |admin|
            mail(to: admin.email, subject: "Une commande a été passée")
        end
    end
end

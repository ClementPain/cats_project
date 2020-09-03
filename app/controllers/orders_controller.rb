class OrdersController < ApplicationController
    def create
        # créer une commande liée au client
        @order=Order.new(user:current_user)
        @order_details = current_user.cart.cat_pictures
        

        # créer x éléments de la commande en récupérant les éléments du panier
        @order_details.each do |image|
            OrdersDetail.create(order:@order, cat_picture:image)
        end
        
        @order.create

        #détruire le panier
        current_user.cart.line_cat_pictures.destroy
        current_user.cart.destroy
        
        #renvoyer l'utilisateur vers ...
        redirect_to root_path, alert: "Votre panier est bien validé"
    end
end

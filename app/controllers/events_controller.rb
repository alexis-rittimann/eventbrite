class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @event = Event.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @event = Event.new('title' => params[:title],'description' => params[:description], 'start_date' => params[:start_date],'duration' => params[:duration],'price' => params[:price],'location' => params[:location],) # avec xxx qui sont les données obtenues à partir du formulaire
    @event.admin = current_user

    if @event.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      redirect_to events_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      puts "nop"*60
      render 'new'
    end
  end
end

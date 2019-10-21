class ContactController < ApplicationController
  def index
    @contact = Contact.new(params[:contact])
  
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      if @contact.deliver
        redirect_to :action => 'index'
        flash[:success] = "Sua mensagem foi recebida. Responderemos em breve!"
      else
        flash.now[:danger] = "Erro no envio. Tente novamente!" 
        render 'index'
      end

  end
end

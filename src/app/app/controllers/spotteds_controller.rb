class SpottedsController < ApplicationController
    before_action :set_college, only: [:index, :new]
    before_action :set_font_google, only: [:index, :new]
    before_action :set_style, only: [:index, :new]
    
    def index
        @spotteds = @college.spotteds
    end

    def new
        @spotted = Spotted.new
        @spotted.user = current_user
    end

    def show
        @spotted = Spotted.find(params[:id])
        @comments = @spotted.comment.all
    end

    def create
        @spotted = Spotted.new(spotted_params)
        @spotted.user = current_user
        @spotted.college = College.find(params[:college_id])
        @spotted.college_spotted_counter = Spotted.where(college_id: @spotted.college_id).count + 1
        
        if (spotted_params[:image])
            img_file = spotted_params[:image].tempfile.open.read.force_encoding(Encoding::UTF_8)
            @spotted.image = Base64.encode64(img_file)
        end

        if @spotted.save
            flash[:sucess] = 'Spotted cadastrado com sucesso'
            redirect_to college_spotteds_path
        else
            render 'new'
        end
    end

    def list_likes
        @spotted = Spotted.find(params[:spotted_id])
        respond_to do |format|
            format.html
            format.js
        end
    end

    def destroy
        @spotted = Spotted.find(params[:id])  
        @spotted.destroy
        flash[:success] = 'Spotted apagado com sucesso'
        redirect_to college_spotteds_path(@spotted.college)
    end

    def favorite
        @spotted = Spotted.find(params[:id])
        type = params[:type]
        if type == "favorite"
            current_user.notification << @spotted
            notice = "Você favoritou esse spotted com sucesso"
            flash[:success] = notice
            redirect_back fallback_location: college_spotteds_path(@spotted.college)

        elsif type == "unfavorite"
            current_user.notification.delete(@spotted)
            notice = "Você desfavoritou esse spotted com sucesso"
            flash[:success] = notice
            redirect_back fallback_location: college_spotteds_path(@spotted.college)
        end
        
    end

    private 
        def spotted_params
            params.require(:spotted).permit(:content, :image)
        end

        def set_user_creator
            user = User.find_by(email: params[:session][:email].downcase)
        end

        def set_college
            @college = College.find(params[:college_id])
        end

        def set_style
            @college_style = ''

            if @college.background_image.present?
                @college_style.concat('body { background-image: url(' + @college.background_image + '); }')
            elsif @college.background_color.present?
                @college_style.concat('body { background-color:' + @college.background_color + ';}')
            end
            
            if @college.font_family.present? && @college.font_color.present?
                @college_style.concat('#content-container { font-family: ' + @college.font_family + '!important; color: ' + @college.font_color + '; }')
            elsif @college.font_family.present?
                @college_style.concat('#content-container { font-family: ' + @college.font_family + '!important; }')
            elsif @college.font_color.present?
                @college_style.concat('#content-container { color: ' + @college.font_color + '; }')
            end
        end

        def set_font_google
            response = HTTParty.get('https://fonts.googleapis.com/css?family=' + @college.font_family)

            if response.code == 200 || response.code == "200"
                @font_google_link = "https://fonts.googleapis.com/css?family=" + @college.font_family
            end
        end
end
class CollegeWhitelistsController < ApplicationController
    before_action :require_logged_in_user
    before_action :set_college
    before_action :set_college_whitelist, only: [:show, :edit, :destroy]

    def verify_permission
        if @college.request_to_participate == "0"
          redirect_to college_spotteds_path(college_id: @college.id)
        else
          check_college_access_permission
        end
    end

    # GET /college_whitelists
    # GET /college_whitelists.json
    def index
        if isPageAdmin(params[:college_id])
            set_whitelist_by_college
            render :index
        else
            flash[:danger] = 'Área restrita. Você não é administrador da página.'
            redirect_to colleges_path
        end
    end

    # GET /college_whitelists/new
    def new
        @college_whitelist = CollegeWhitelist.find_by(user_id: current_user.id, college_id: @college.id)
        if @college_whitelist.nil?
            @college_whitelist = CollegeWhitelist.new
            render :new
        else
            redirect_to college_verify_permission_path(college_id: @college.id)
        end
    end

    # POST /college_whitelists
    # POST /college_whitelists.json
    def create
        @college_whitelist = CollegeWhitelist.new(college_whitelist_params)
        @college_whitelist.user = current_user
        @college_whitelist.college = @college

        respond_to do |format|
            if @college_whitelist.save
                format.html { render :template => "college_whitelists/pending", notice: 'College whitelist was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end    

    def update
        @college_whitelist = CollegeWhitelist.find(params[:id])
        respond_to do |format|
            if @college_whitelist.update(status: params[:college_whitelist][:status])
                format.html { redirect_to college_college_whitelists_path }
            else   
                format.html { 
                    flash[:danger] = "Não foi possível alterar a credencial do usuário para reprovado."
                    render :index 
                }
            end
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_college_whitelist
            @college_whitelist = CollegeWhitelist.find(params[:id])
        end

        def set_college
            @college = College.find(params[:college_id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def college_whitelist_params
            params.require(:college_whitelist).permit(:status)
        end

        def set_whitelist_by_college
            @college_whitelists = CollegeWhitelist.where(college_id: params[:college_id])
        end

        def check_college_access_permission
            @college_whitelist = CollegeWhitelist.find_by(user_id: current_user.id, college_id: @college.id)
          if !@college_whitelist.nil?
            check_request_access_status(@college_whitelist)
          else
            @college_whitelist = CollegeWhitelist.new
            render :new
          end
        end

        def check_request_access_status(college_whitelist)
            case college_whitelist.status
            when "approved"
              redirect_to college_spotteds_path(college_id: @college.id)
            when "pending"
              render :template => "college_whitelists/pending"
            when "rejected"
              render :template => "college_whitelists/rejected"
          end
        end

        def return_status_enum(status)
            p status
            CollegeWhitelist.statuses[status]
        end
end
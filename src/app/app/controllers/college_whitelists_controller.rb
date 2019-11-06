class CollegeWhitelistsController < ApplicationController
    before_action :set_college_whitelist, only: [:show, :edit, :update, :destroy]

    # GET /college_whitelists
    # GET /college_whitelists.json
    def index
        @college_whitelists = CollegeWhitelist.all
    end

      # GET /college_whitelists/1
    # GET /college_whitelists/1.json
    def show
    end

    # GET /college_whitelists/new
    def new
        @college_whitelist = CollegeWhitelist.new
    end

      # GET /college_whitelists/1/edit
    def edit
    end

    # POST /college_whitelists
    # POST /college_whitelists.json
    def create
        @college_whitelist = CollegeWhitelist.new(college_whitelist_params)

        respond_to do |format|
            if @college_whitelist.save
                format.html { redirect_to @college_whitelist, notice: 'College whitelist was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    # PATCH/PUT /college_whitelists/1
    # PATCH/PUT /college_whitelists/1.json
    def update
        respond_to do |format|
        if @college_whitelist.update(college_whitelist_params)
            format.html { redirect_to @college_whitelist, notice: 'College whitelist was successfully updated.' }
        else
            format.html { render :edit }
        end
        end
    end

    # DELETE /college_whitelists/1
    # DELETE /college_whitelists/1.json
    def destroy
        @college_whitelist.destroy
        respond_to do |format|
            format.html { redirect_to college_whitelists_url, notice: 'College whitelist was successfully destroyed.' }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_college_whitelist
            @college_whitelist = CollegeWhitelist.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def college_whitelist_params
            params.require(:college_whitelist).permit(:status)
        end
end
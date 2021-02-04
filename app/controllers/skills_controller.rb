class SkillsController < ApplicationController
    before_action :require_login
    
    def index   
        @skills = Skill.all
    end

    def show
        @skill = Skill.find(params[:id])
        @users = @skill.users
    end
end

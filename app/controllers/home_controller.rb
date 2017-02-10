require 'rake'

Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
PDSAssessment::Application.load_tasks # providing your application name is 'sample'

class HomeController < ApplicationController
    before_action :check_authentication, only: [:dashboard]

    def home
    end

    def dashboard
    end

    def populate_rake
        username = params[:username]
        password = params[:password]
        @user = User.find_by_username(username).first
        if @user.blank?
          flash[:notice] = "Invalid username"
          render 'dashboard'
        else
          # These methods are in the helper file.
          if confirm_user(@user, password)
            Rake::Task['db:populate'].reenable # in case you're going to invoke the same task second time.
            Rake::Task['db:populate'].invoke
            flash[:notice] = "Database reset!"
            render 'dashboard'
          else
            flash[:notice] = "The username and password do not match"
            render 'dashboard'
          end
        end
    end

end

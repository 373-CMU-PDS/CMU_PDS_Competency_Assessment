module AssessmentHelpers
    module Authentication

        def login_user(user)
            session[:user] = user
        end

        def logout_user
            session[:user] = nil
        end

        def is_logged_in?
            return !session[:user].nil?
        end

        def authenticate_user
            if !is_logged_in?
                redirect_to sign_in_path
            end
        end

        def confirm_user(user, password)
            encrypted_password = BCrypt::Engine.hash_secret(password, user.salt)
            return user.encrypted_password.eql?(encrypted_password)
        end

    end
end
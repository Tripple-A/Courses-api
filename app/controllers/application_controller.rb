class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'my_secret')
    end

    def session_user
        decoded_hash = decoded_token
        if !decoded_hash.empty?
            user_id = decoded_hash[0]['user_id']
            @user = User.find_by(id: user_id)
        else
        end
    end
end

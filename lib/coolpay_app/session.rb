require 'json'
require 'rest-client'

class Session
    # Class instance variables
    attr_reader :auth_token
    @auth_token = nil

    def self.new
        @@authenticate_url = "#{CoolpayApp.get_base_url()}login"
        @@base_headers = CoolpayApp.get_base_headers()
        self.authenticate()
        super
    end

    def self.authenticate
        # Authenticate
        values = '{
          "username": "luigi",
            "apikey": "E9DA82F4C252E7F1"
            }'

        begin
            response = RestClient.post @@authenticate_url,
                                       values,
                                       @@base_headers
            json_resp = JSON.parse(response.body)
            @auth_token = json_resp['token']
            @@base_headers['authorization'] = "Bearer #{@auth_token}"
            CoolpayApp.set_base_headers(@@base_headers)
        rescue RestClient::ExceptionWithResponse => err
            err.response
        end
    end
end

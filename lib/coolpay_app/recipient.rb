require 'json'
require 'rest-client'

module Recipient

    def self.recipient_url
      @recipient_url ||= "#{CoolpayApp.get_base_url()}recipients"
    end

    # List recipients
    def self.list_recipients
        begin
            response = RestClient.get recipient_url,
                                      CoolpayApp.get_base_headers()
            json_resp = JSON.parse(response.body)
            return json_resp["recipients"]
        rescue RestClient::ExceptionWithResponse => err
            err.response
        end
    end


    def self.recipient_exist(recipient_name)
        begin
            response = RestClient.get "#{recipient_url()}?name=#{recipient_name}",
                                      CoolpayApp.get_base_headers()
            json_resp = JSON.parse(response.body)
            if json_resp["recipients"].length > 0
                return true
            else
                return false
            end
        rescue RestClient::ExceptionWithResponse => err
            err.response
        end
    end


    def self.get_recipient_id(recipient_name)
        begin
            response = RestClient.get "#{recipient_url()}?name=#{recipient_name}",
                                      CoolpayApp.get_base_headers()
            json_resp = JSON.parse(response.body)
            if json_resp["recipients"].length == 0
                puts "Could not get the recipient id for #{recipient_name}"
            elsif json_resp["recipients"].length == 1
                return json_resp["recipients"][0]["id"]
            else
                puts "There is more than one recipient with the same name"
            end
        rescue RestClient::ExceptionWithResponse => err
            err.response
        end
    end

    # Add recipient
    def self.add_recipient(name)
        unless recipient_exist(name)
            begin
                values = "{
                    \"recipient\": {
                        \"name\": \"#{name}\" } }"
                respose = RestClient.post recipient_url, values,
                                          CoolpayApp.get_base_headers()
                return get_recipient_id(name)
            rescue RestClient::ExceptionWithResponse => err
                err.response
            end
          else
              return get_recipient_id(name)
        end
    end
end

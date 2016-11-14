require 'json'
require 'rest-client'

module Payment

    def self.payments_url
      @payments_url ||= "#{CoolpayApp.get_base_url()}payments"
    end


    # Make payment
    def self.make_payment(amount, currency, recipient_id)
        values = "{
            \"payment\": {
                \"amount\": #{amount},
                \"currency\": \"#{currency}\",
                \"recipient_id\": \"#{recipient_id}\"} }"

        begin
            response = RestClient.post payments_url, values,
                                       CoolpayApp.get_base_headers()
            json_resp = JSON.parse(response.body)
            if json_resp["errors"]
                puts json_resp["errors"]
            else
                return json_resp["payment"]["id"]
            end
        rescue RestClient::ExceptionWithResponse => err
            err.response
        end
    end

    # Check payment
    def self.get_payment_status(id)
        begin
            response = RestClient.get payments_url,
                                  CoolpayApp.get_base_headers()
            json_resp = JSON.parse(response)
            (json_resp["payments"]).each do |p|
                if p["id"] == id
                    return p["status"]
                end
            end
            return nil
        rescue RestClient::ExceptionWithResponse => err
            err.response
        end
    end
end

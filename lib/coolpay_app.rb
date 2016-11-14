require 'coolpay_app/version'
require 'rubygems' if RUBY_VERSION < '1.9'
require_relative 'coolpay_app/session'
require_relative 'coolpay_app/recipient'
require_relative 'coolpay_app/payment'



#------------------------------------------------------------
# the top-level module
#
# @api public
module CoolpayApp

    attr_accessor :auth_token
    @@auth_token = nil

    attr_accessor :base_headers
    @@base_headers = {
        content_type: 'application/json'
    }
    attr_reader :base_url
    @@base_url = 'https://coolpay.herokuapp.com/api/'

    def self.get_base_url()
        @@base_url
    end

    def self.get_base_headers()
        @@base_headers
    end

    def self.set_base_headers(headers)
        @@base_headers = headers
    end
end

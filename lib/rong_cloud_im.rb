require 'openssl'
require 'net/http'
require 'json'
require 'rong_cloud_im/version'
require 'rong_cloud_im/service'

module RongCloudIM

  class << self
    attr_accessor :app_key, :app_secret, :response_type
  end

end
require 'rubygems'
require 'httparty'

module RingRingMedia
  class Advert
    include HTTParty
    base_uri 'http://iam.ringringmedia.com'

    def get(id, options = {})
      options = {:pid => id, :mu => "xml", :mo => "live", :e => "UTF-8", :rt => "ar", :ua => "", :ira => "" }.merge(options)    
      self.class.get('/index.php', { :query => options })
    end

    def post(id, options = {})
      options = {:pid => id, :mu => "xml", :mo => "live", :e => "UTF-8", :rt => "ar", :ua => "", :ira => "" }.merge(options)    
      self.class.post('/index.php', { :query => options })
    end
  end
end
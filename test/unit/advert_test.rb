require File.expand_path('../../test_helper', __FILE__)

class AdvertTest < Test::Unit::TestCase
  
  context "Requesting an advert" do
    setup do
      @iphone_useragent = "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3"
      @ip = "212.58.246.158" # bbc.co.uk
      @id = "YOUR ID HERE"
      
      @ad = Advert.new
    end

    should "Return advert from a http POST" do
      response = @ad.post(@id, { :ua => @iphone_useragent, :ira => @ip, :mo => "test" })
      assert_not_nil(response)
      assert_match(/<adResponse>/, response)
    end
    
    should "Return advert from a http GET" do
      response = @ad.get(@id, { :ua => @iphone_useragent, :ira => @ip, :mo => "test" })
      assert_not_nil(response)
      assert_match(/<adResponse>/, response)
    end
  end
  
  
end
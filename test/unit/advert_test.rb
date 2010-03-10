require File.expand_path('../../test_helper', __FILE__)

class AdvertTest < Test::Unit::TestCase
  
  context "Requesting an advert" do
    setup do
      
      @XML_response = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<!DOCTYPE adResponse SYSTEM \"http://dtd.ringringmedia.com/adresponse.dtd\">\n<adResponse><clickUrl>http://iam4.ringringmedia.com/cindex.php?rt=ct&amp;iamid=220638087&amp;iamt=fGSDYfq8U65G0mwBv9pMeamvt6N7suZetWEGfa4D5w.mtjtvb2Tzu8hrm0PH2MWyRo7NPs1OynzU0kUAOMiqoqK9WxISrt8le99Pc8dpuozKtm/r89v8ccov3pv/7uHuxaJY7Gqel8af8.ndD7nlONxyXCQAvTzmbL4d68jiyHynkbg/9f5mXzuzRgf/dfB3tA3l30wLoDJee/AOsjwpQ7J5jXJsxauEGDrjmUXK2.L5pS4nYqZlEFfo5/alA/gIuC4hHXCPc1g9LqkmAWEbhM0Syk0xdGMNUAYX3w7OGeo_</clickUrl><imageUrl>http://bank14.ads.dt.mydas.mobi/getImage.php5?asid=1458&amp;mode=live&amp;acid=20165&amp;auid=87.194.69.174&amp;osid=14&amp;urid=387a7e63e65e12e8b44940a98006d8dc&amp;ri=14&amp;mmid=2782&amp;orut=1268231518</imageUrl><imageWidth>300</imageWidth><imageHeight>50</imageHeight></adResponse>\n"
             
      @iphone_useragent = "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3"
      @ip = "212.58.246.158" # bbc.co.uk
      @id = "12334"
      
      @ad = RingRingMedia::Advert.new
    end
    should "Return advert from a http GET" do
      stub_request(:get, "http://iam.ringringmedia.com/index.php?pid=#{@id}&ua=#{@iphone_useragent}&rt=ar&mo=test&ira=#{@ip}&e=UTF-8&mu=xml").to_return(:body => @XML_response, :status => 200)
      response = @ad.get(@id, { :ua => @iphone_useragent, :ira => @ip, :mo => "test" })
      assert_not_nil(response)
      assert_match(/<adResponse>/, response)
    end
      
    should "Return advert from a http POST" do
      stub_request(:post, "http://iam.ringringmedia.com/index.php?pid=#{@id}&ua=#{@iphone_useragent}&rt=ar&mo=test&ira=#{@ip}&e=UTF-8&mu=xml").to_return(:body => @XML_response, :status => 200)
      response = @ad.post(@id, { :ua => @iphone_useragent, :ira => @ip, :mo => "test" })
      assert_not_nil(response)
      assert_match(/<adResponse>/, response)
    end
    
  end
  
  
end
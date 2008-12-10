require File.dirname(__FILE__) + '/../init.rb'

describe Icontact do
  before(:each) do
    Icontact.settings = {
       :url => "http://app.icontact.com/icp/signup.php",
       :listid => "9901374",
       :clientid => "36539",
       :formid => "2790",
       :specialid => "JASP",
       :reallistid => "1",
       :doubleopt => "0"
    }
  end
  
  describe "initialization" do
    it "should initialize properly" do
      ic = Icontact.new
    end
    
    it "should store values to a hash" do
      ic = Icontact.new
      ic.settings.should_not be_nil
    end
    
    it "should define a url" do
      ic = Icontact.new
      ic.url.should == "http://app.icontact.com/icp/signup.php"
    end
  end
  
  describe "pre post submission" do
    before(:each) do
      @options = {:first_name => "Nate", :last_name => "Miller", :email => "dev@urbaninfluence.com"}
    end
    
    it "should create a hash of data to be sent to the form when no options are given" do
      ic = Icontact.new
      ic.create_post_string.should == "?clientid=36539&doubleopt=0&formid=2790&listid=9901374&reallistid=1&specialid:9901374=JASP&url=http://app.icontact.com/icp/signup.php"      
    end
    
    it "should create a hash of data when options are given" do
      ic = Icontact.new
      rslt = ic.create_post_string(:fields_fname => "nate", :fields_lname => "miller", :fields_email => "dev@urbaninfluence.com")
      rslt.should == "?clientid=36539&doubleopt=0&fields_email=dev@urbaninfluence.com&fields_fname=nate&fields_lname=miller&formid=2790&listid=9901374&reallistid=1&specialid:9901374=JASP&url=http://app.icontact.com/icp/signup.php" 
      
    end
  end
  
  describe "submission" do
    it "should submit successfully with valid data" do
      ic = Icontact.new
      result = ic.submit(:fields_fname => "nate", :fields_lname => "miller", :fields_email => "dev@urbaninfluence.com")
      result.should be_true
    end
    
    it "should fail with bad email address" do
      ic = Icontact.new
      result = ic.submit(:fields_fname => "nate", :fields_lname => "miller", :fields_email => "dev@urbaninfluence")
      result.should be_false
    end
  end
end
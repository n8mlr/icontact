require 'rubygems'
require 'facets'
require 'net/http'
require 'open-uri'

class Icontact

  @@settings = { :url => nil,
                 :listid => nil,
                 :clientid => nil,
                 :formid => nil,
                 :specialid => nil,
                 :reallistid => nil,
                 :doubleopt => nil}
  cattr_accessor :settings
  
  class << self

  end
  
  attr_accessor :form_vars
  
  def settings
    @settings || @@settings
  end
    
  def settings=(settings)
    @settings = settings
  end
  
  def url
    settings[:url]
  end
  
  def submit(options)
    create_post_string(options)
    uri = URI.parse(settings[:url])
    req = Net::HTTP::Post.new(url)
    req.set_form_data(@form_vars)
    response = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }
    determine_success(response)
  end
  
  def create_post_string(options = {})
    data = {}
    data.merge!(settings)
    data.merge!(options)
    data.stringify_keys!
    
    # modify the specialid value that icontact expects to receive, converts "specialid" => "specialid:XXXX" where XXXX is the list id
    specialid = settings[:specialid]
    data.delete("specialid")
    @form_vars = data.merge!({"specialid:#{settings[:listid]}" => specialid})

    param_array = []
    @form_vars.each { |k,v| param_array << "#{k}=#{v}"}
    param_array.sort! # alphabetize for easier testing
    pstring = "?" << param_array.join("&")
  end
  
  private 
  
  # As the service currently only utilizes an HTTP interface, we look for "THANK YOU" or "ERROR" and return 1 or 0 respectively
  def determine_success(html_response)
    html_response.body.scan(/ERROR/).empty?
  end
  
end

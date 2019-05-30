require "logstash/filters/base"
require "logstash/namespace"

class LogStash::Filters::Urllookup < LogStash::Filters::Base

  config_name "urllookup"

  config :domain, :validate => :string, :default => 


  public
  def register
    @domains = Hash.new
    list = Hash.new
    file = File.read('BL/domains').split("\n")
    file.each do |line|
      info = line.split(/|/)
      @domains[info[0]] = info[1]
    end
  end 

  public
  def filter(event)

    if @domain
      message = @domains[@domain].nil? 'Unknown' | @domains[@domain]
      event.set("urlcategory", message)
    end

    filter_matched(event)
  end 
end

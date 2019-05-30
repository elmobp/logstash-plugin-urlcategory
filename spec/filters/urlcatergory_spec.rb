# encoding: utf-8
require 'spec_helper'
require "logstash/filters/urllookup"

describe LogStash::Filters::Example do
  describe "Lookup Google in URL filter" do
    let(:config) do <<-CONFIG
      filter {
        urllookup {
          domain => "google.com"
        }
      }
    CONFIG
    end

    sample("domain" => "google.com") do
      expect(subject.get("urlcategory")).to eq('searchengines')
    end
  end
end

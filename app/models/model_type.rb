require 'mechanize'
require 'nokogiri'
require 'open-uri'

class ModelType < ActiveRecord::Base
  validates	:base_price, presence: true

	belongs_to :model

	before_save :synchronize_name_and_slug

	extend FriendlyId
	friendly_id :name, use: :slugged, slug_column: :model_type_slug

	def total_price
		if self.model.organization.pricing_policy == "Flexible"
		  
		  page = Nokogiri::HTML(open("http://reuters.com"))
		  
      node_array = []
      margin = 0
      
      page.traverse{ |x|
          if x.text? and not x.text =~ /^\s*$/
              node_array << x
          end
      }
      node_array.each do |i|
          margin = margin + i.to_s.count('a')
      end
      return total = self.base_price * margin/100
      
		elsif self.model.organization.pricing_policy == "Fixed"
		
			mechanize = Mechanize.new
			margin = mechanize.get('https://developer.github.com/v3/#http-redirects')
			return total = self.base_price + margin.search("//*[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'status')]").count

		else self.model.organization.pricing_policy == "Prestige"
		  
			mechanize = Mechanize.new
			margin = mechanize.get('http://www.yourlocalguardian.co.uk/sport/rugby/rss/')
			return total = self.base_price + margin.search('pubDate').count
			
		end
	end

	def synchronize_name_and_slug
		if self.name.blank? || self.name != self.model_type_slug
			self.name = self.model_type_slug
		end
	end
end

require 'mechanize'

class ModelType < ActiveRecord::Base
  validates	:name, :model_type_slug, :model_type_code, :base_price, :model_id, presence: true

	belongs_to :model

	def total_price
		if self.model.organization.pricing_policy == "Flexible"
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
end

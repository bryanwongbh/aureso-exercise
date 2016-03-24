require 'mechanize'

class ModelType < ActiveRecord::Base
  validates	:base_price, :model_id, presence: true

	belongs_to :model

	before_save :add_name_field

	extend FriendlyId
	friendly_id :name, use: :slugged, slug_column: :model_type_slug

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

	def add_name_field
		if self.name.blank?
			self.name = self.model_type_slug
		end
	end
end

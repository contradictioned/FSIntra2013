# == Schema Information
#
# Table name: tabs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  paid       :boolean
#

class Tab < ActiveRecord::Base
	has_many :beverage_tabs
	has_many :beverages, :through => :beverage_tabs
	belongs_to :user

	scope :paid, -> { where :paid => true }
	scope :unpaid, -> { where :paid => false }
	
	def total_invoice
		total = 0.0
		self.beverage_tabs.each do |b|
			puts b
			total += b.price * b.count
		end
		return total
	end
end

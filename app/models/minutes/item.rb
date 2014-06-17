# == Schema Information
#
# Table name: minutes_items
#
#  id         :integer          not null, primary key
#  date       :date
#  title      :string(255)
#  content    :text
#  order      :integer
#  minute_id  :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_minutes_items_on_minute_id  (minute_id)
#

class Minutes::Item < ActiveRecord::Base
  belongs_to :minute, class_name: 'Minutes::Minute'
  has_many :motions, class_name: 'Minutes::Motion', dependent: :destroy

  validates_presence_of :order
  #validate :orders_must_be_sequence # TODO

  def move_up
    other = Minutes::Item.where(minute: minute).where(order: order-1).first
    if other
      other.order = order
      self.order = order - 1
      other.save
      self.save
    end
  end

  def move_down
    other = Minutes::Item.where(minute: minute).where(order: order+1).first
    if other
      other.order = self.order
      self.order = self.order + 1
      other.save
      self.save
    end
  end

  # By default every minute has as first item 'agenda aggreement'
  # and as second item 'approvement of previous minutes'
  # This methods enriches the stored items
  def full_order
    offset = minute.type == nil ? 3 : 2
    order + offset
  end

  private 

  def orders_must_be_sequence
    # 1. collect orders
    orders = []
    minute.items.each do |i|
      orders << i.order
    end

    # 2. sortem
    orders.sort!

    if orders != (0..orders.length - 1).to_a
      errors.add :order, "is not in a decent order"
    end
  end
end

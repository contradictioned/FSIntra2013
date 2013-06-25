# == Schema Information
#
# Table name: minutes_motions
#
#  id         :integer          not null, primary key
#  rationale  :text
#  mover_id   :integer
#  amount     :decimal(, )
#  pro        :integer
#  abs        :integer
#  con        :integer
#  created_at :datetime
#  updated_at :datetime
#  item_id    :integer
#  approved   :boolean          default(FALSE)
#
# Indexes
#
#  index_minutes_motions_on_mover_id  (mover_id)
#

class Minutes::BudgetMotion < Minutes::Motion

validates_presence_of :amount

end

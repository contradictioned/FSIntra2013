# == Schema Information
#
# Table name: minutes_minutes
#
#  id                       :integer          not null, primary key
#  date                     :date
#  keeper_of_the_minutes_id :integer
#  chairperson_id           :integer
#  released_date            :date
#  has_quorum               :boolean
#  created_at               :datetime
#  updated_at               :datetime
#  guests                   :text
#  draft_sent_date          :date
#  type                     :string(255)
#
# Indexes
#
#  index_minutes_minutes_on_chairperson_id            (chairperson_id)
#  index_minutes_minutes_on_keeper_of_the_minutes_id  (keeper_of_the_minutes_id)
#

class Minutes::PlenumMinute < Minutes::Minute

  def item_titles
    ['Genehmigung von Protokollen'] + items.pluck(:title)
  end
end

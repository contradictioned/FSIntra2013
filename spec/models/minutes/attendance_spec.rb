# == Schema Information
#
# Table name: minutes_attendances
#
#  absent    :string(255)
#  user_id   :integer
#  minute_id :integer
#  id        :integer          not null, primary key
#
# Indexes
#
#  index_minutes_attendances_on_id  (id)
#

require 'spec_helper'

describe Minutes::Attendance do
  pending "add some examples to (or delete) #{__FILE__}"
end
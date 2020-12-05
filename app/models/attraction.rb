# == Schema Information
#
# Table name: attractions
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :integer
#  park_id     :integer
#
class Attraction < ApplicationRecord
  belongs_to(:park, { :required => false, :class_name => "Park", :foreign_key => "park_id" })

  belongs_to(:activity, { :required => false, :class_name => "Activity", :foreign_key => "activity_id" })

  validates(:park_id, { :presence => true })

  validates(:name, { :presence => true })

  validates(:activity_id, { :presence => true })
end

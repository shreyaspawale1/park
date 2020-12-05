# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Activity < ApplicationRecord
  has_many(:attractions, { :class_name => "Attraction", :foreign_key => "activity_id", :dependent => :destroy })

  has_many(:parks, { :through => :attractions, :source => :park })

  validates(:name, { :presence => true })
end

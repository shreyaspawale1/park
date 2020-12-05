# == Schema Information
#
# Table name: parks
#
#  id              :integer          not null, primary key
#  name            :string
#  open_year_round :boolean
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  state_id        :integer
#
class Park < ApplicationRecord
  has_many(:attractions, { :class_name => "Attraction", :foreign_key => "park_id", :dependent => :destroy })

  has_many(:trips, { :class_name => "Trip", :foreign_key => "park_id", :dependent => :destroy })

  belongs_to(:state, { :required => false, :class_name => "State", :foreign_key => "state_id" })

  has_many(:activities, { :through => :attractions, :source => :activity })

  has_many(:users, { :through => :trips, :source => :user })

  validates(:state_id, { :presence => true })

  validates(:name, { :presence => true })
end

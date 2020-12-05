# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  capital    :string
#  name       :string
#  website    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class State < ApplicationRecord
  has_many(:parks, { :class_name => "Park", :foreign_key => "state_id", :dependent => :destroy })

  validates(:name, { :presence => true })
end

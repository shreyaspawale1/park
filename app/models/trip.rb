# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  departs_at :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  park_id    :integer
#  user_id    :integer
#
class Trip < ApplicationRecord
  belongs_to(:park, { :required => false, :class_name => "Park", :foreign_key => "park_id" })

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
end

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
end

# == Schema Information
#
# Table name: api_tokens
#
#  id           :integer          not null, primary key
#  access_token :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ApiToken < ActiveRecord::Base
  # Validations
  validates :access_token, presence: true
end

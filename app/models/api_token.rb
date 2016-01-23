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
  # Callbacks
  before_create :generate_access_token

  private

    # Private: Genereate access token
    #
    # Return a Token
    def generate_access_token
      loop do
        self.access_token = SecureRandom.hex
        break unless self.class.exists?(access_token: access_token)
      end
    end
end

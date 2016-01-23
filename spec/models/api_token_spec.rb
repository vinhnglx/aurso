# == Schema Information
#
# Table name: api_tokens
#
#  id           :integer          not null, primary key
#  access_token :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe ApiToken, type: :model do
  context 'attributes' do
    it 'has access_token' do
      api_token = build(:api_token, access_token: 'S3cur3Rad0mdothex')
      expect(api_token).to have_attributes(access_token: 'S3cur3Rad0mdothex')
    end
  end
end

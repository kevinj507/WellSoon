# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  date       :datetime
#  pain       :integer
#  diary      :text
#  medtype    :string
#  activity   :integer
#  doses      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

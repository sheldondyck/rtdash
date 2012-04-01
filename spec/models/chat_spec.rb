# == Schema Information
#
# Table name: chats
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  instant    :datetime        not null
#  message    :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Chat do
  pending "add some examples to (or delete) #{__FILE__}"
end

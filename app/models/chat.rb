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

class Chat < ActiveRecord::Base
  belongs_to :user

  attr_accessible :instant, :message

  validates :user_id,   :presence => true
  validates :message,   :presence => true,
                        :length => { :minimum => 2, :maximum => 255 }

  before_create :set_defaults

  def format_instant
    instant.to_s(:long)
  end

  private
    def set_defaults
      self.instant = Time.now
    end
end

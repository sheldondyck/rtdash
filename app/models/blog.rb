# == Schema Information
#
# Table name: blogs
#
#  id             :integer          not null, primary key
#  system_user_id :integer          not null
#  instance       :datetime         not null
#  title          :string(255)      not null
#  message        :string(255)      not null
#  url            :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# TODO: think of better field name for url. 
# TODO: should we store the whole url year/month/day/keyword in the 'url' field?
#
class Blog < ActiveRecord::Base
  belongs_to :system_user

  validates :system_user_id,    :presence => true
  validates :title,             :presence => true,
                                :length => { :minimum => 2}
  validates :message,           :presence => true,
                                :length => { :minimum => 2}
  validates :url,               :presence => true,
                                :length => { :minimum => 2}

  attr_accessible :title, :message, :instance, :url
end

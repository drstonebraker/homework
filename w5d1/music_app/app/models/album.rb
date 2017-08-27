# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :band_id, :is_live, presence: true

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band

end

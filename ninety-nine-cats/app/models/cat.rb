# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = ['Orange', 'Tabby', 'Black', 'White', 'Gray', 'Grey', 'Brown']

    
    validates :color, :name, :birth_date, :sex, presence: true
    validates :color, inclusion: {in: CAT_COLORS}
    validates :sex, inclusion: { in: ['M', 'F'] }
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date && birth_date > Date.today
            errors.add(:birth_date, "No time traveling cats.")
        end
    end

    def age
        time_ago_in_words(self.birth_date)
    end
end

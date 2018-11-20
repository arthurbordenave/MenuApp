class Item < ApplicationRecord
    has_many :strains, dependent: :destroy
    accepts_nested_attributes_for :strains,
                                  reject_if: :all_blank, 
                                  allow_destroy: true
    validates :title, presence: true
end

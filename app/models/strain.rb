class Strain < ApplicationRecord
    has_many :wine_strains, dependent: :destroy
    has_many :wines, through: :wine_strains

    validates :name, presence: true, uniqueness: true
end

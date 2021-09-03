class Wine < ApplicationRecord
    has_many :wine_strains, dependent: :destroy
    has_many :strains, through: :wine_strains
    
    validates :name, presence: true
    
    def addStrainPercent(percents)
        percents.each do |strain_id, percent|
            if percent != ''
                temp_strain = self.wine_strains.where(strain_id: strain_id).first
                temp_strain.percent = percent
                temp_strain.save
            end
        end
    end

    def strain_names_and_percentages
        list=[]
        orderlist=[]
        wine_strains.map do |ws|
            list << [ws.strain.name, ws.percent]
        end
        
        list.sort_by{ |strain| strain[0]}.map do |cepa|
            "#{cepa[0]} (#{cepa[1]}%)"         
        end.join(', ')
        
    end

    
end

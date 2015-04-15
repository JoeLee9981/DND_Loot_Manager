class LootRoll < ActiveRecord::Base
   validates :level, presence: true,
                    numericality: { only_integer: true }
                    
   validates :loot_type, presence: true
   
   validates :low_roll, presence: true,
                    numericality: { only_integer: true }
   
   validates :high_roll, presence: true,
                    numericality: { only_integer: true }
   
   validates :die, presence: true
   
   validates :scale, presence: true,
                    numericality: { only_integer: true }
   
   validates :coin_type, presence: true
   
   validates :sub_type, presence: true
   
end

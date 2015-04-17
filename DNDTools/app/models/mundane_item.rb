class MundaneItem < ActiveRecord::Base
  validates :name, presence: true
  
  validates :low, presence: true,
                    numericality: { only_integer: true }
                    
  validates :high, presence: true,
                    numericality: { only_integer: true } 
                  
  validates :sub_low, presence: true,
                    numericality: { only_integer: true }
                    
  validates :sub_high, presence: true,
                    numericality: { only_integer: true } 
                    
  validates :avg_val, presence: true
end

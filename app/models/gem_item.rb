class GemItem < ActiveRecord::Base
  
  validates :name, presence: true
  
  validates :low, presence: true,
                    numericality: { only_integer: true }
                    
  validates :high, presence: true,
                    numericality: { only_integer: true } 
                    
  validates :avg_val, presence: true
              
end

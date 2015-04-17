
class IndexController < ApplicationController
  include IndexHelper
  
  def index
    @error = nil;
    @gem_items = GemItem.all
    @art_items = ArtItem.all
    @loot_rolls = LootRoll.all
    @mundane_items = MundaneItem.all
    @minor_items = MinorItem.all
    @medium_items = MediumItem.all
    @major_items = MajorItem.all
    
    @rolls = Array.new
    
    for i in 0..19
      @rolls.push(Array.new)
    end
    
    @loot_rolls.each do |loot_roll|
      @rolls[loot_roll.level - 1].push(loot_roll)
    end
    
    @level = 0
    
    if params.has_key?(:level)
      begin
        @level = Integer(params[:level])
        
        if @level < 1 or @level > 20
          @level = 0
          @error = "You must select a level range from 1 to 20"
        end
      rescue
        @error = "You must select a level range from 1 to 20"
      end
      
    end
    
    @gem_count = 0
    @art_count = 0
    @mundane_count = 0
    @minor_count = 0
    @medium_count = 0
    @major_count = 0
    @sub_type = "";
    @result = nil;
    if params.has_key?(:roll)
      @result = do_roll(Integer(params[:roll]))
      @loot_table, @gem_count, @art_count, @mundane_count, @minor_count, @medium_count, @major_count, @sub_type = find_results(@loot_rolls, @result, @level)
    end
    
    if @gem_count > 0
      @gem_table = find_gems(@gem_items, do_roll(Integer(params[:roll])))
    end
    
    if @art_count > 0
      @art_table = find_art(@art_items, do_roll(Integer(params[:roll])))
    end
    
    if @mundane_count > 0
      @mundane_table = find_mundane(@mundane_items, do_roll(Integer(params[:roll])))
    end
    
    if @minor_count > 0
      @minor_table = find_minor(@minor_items, do_roll(Integer(params[:roll])))
    end
    
    if @medium_count > 0
      @medium_table = find_medium(@medium_items, do_roll(Integer(params[:roll])))
    end
    
    if @major_count > 0
      @major_table = find_major(@major_items, do_roll(Integer(params[:roll])))
    end

  end
  
end

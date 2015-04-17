class LootRollsController < ApplicationController
  def new
    @loot_roll = LootRoll.new
  end
  
  def create
    @loot_roll = LootRoll.new(loot_roll_params)
    
    if @loot_roll.save
      redirect_to @loot_roll
    else
      render 'new'
    end
  end
  
  def show
    @loot_roll = LootRoll.find(params[:id])
  end
  
  def edit
    @loot_roll = LootRoll.find(params[:id])
  end
  
  def update
    @loot_roll = LootRoll.find(params[:id])
    
    if @loot_roll.update(loot_roll_params)
      redirect_to @loot_roll
    else
      render 'edit'
    end
  end
  
  def index
    @loot_rolls = LootRoll.all
    
    @rolls = Array.new
    
    for i in 0..19
      @rolls.push(Array.new)
    end
    
    @loot_rolls.each do |loot_roll|
      @rolls[loot_roll.level - 1].push(loot_roll)
    end
    
  end
  
  def destroy
    @loot_roll = LootRoll.find(params[:id])
    @loot_roll.destroy
    
    redirect_to loot_rolls_path
  end
  
  def import
    file = File.new("dnd_loot_rolls.csv", "r")
    file.gets
    while (line = file.gets)
      a = line.split(',')
      @loot_roll = LootRoll.new
      @loot_roll.level = a[0]
      @loot_roll.loot_type = a[1]
      @loot_roll.low_roll = a[2]
      @loot_roll.high_roll = a[3]
      @loot_roll.die = a[4]
      @loot_roll.scale = a[5]
      @loot_roll.coin_type = a[6]
      @loot_roll.sub_type = a[7]
      @loot_roll.save
    end
  end
  
  private
    def loot_roll_params
      params.require(:loot_roll).permit(:level, :loot_type, :low_roll, :high_roll, :die, :scale, :coin_type, :sub_type)
    end
end

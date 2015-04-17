module IndexHelper
  def do_roll(range)
    return rand(1..range)
  end
  
  def find_results(loot_rolls, roll, level)
    
    @gem_count = 0
    @art_count = 0
    @mundane_count = 0
    @minor_count = 0
    @medium_count = 0
    @major_count = 0
    @weapons_count = 0
    
    @loot_table = "<table><tr><th>name</th><th>roll</th><th>Loot</th><th>results</th></tr>"
    
    loot_rolls.each do |loot_roll|
      if level == loot_roll.level and (roll >= loot_roll.low_roll and roll <= loot_roll.high_roll) and loot_roll.scale > 0
        @sub_type = loot_roll.sub_type.strip!
        @loot_table += "<tr><td>%d</td>" % loot_roll.level
        @loot_table += "<td>%d - %d</td>" % [ loot_roll.low_roll, loot_roll.high_roll ]
        if loot_roll.coin_type != "none"
           @loot_table += "<td>%s * %d %s</td>" % [loot_roll.die, loot_roll.scale, loot_roll.coin_type]
           @loot_table += "<td>%d %s</td>" % [die_roll(loot_roll.die) * Integer(loot_roll.scale), loot_roll.coin_type]
        else
          @loot_table += "<td>%s * %d %s</td>" % [loot_roll.die, loot_roll.scale, loot_roll.sub_type]
          if @sub_type == "gems"
            @temp = die_roll(loot_roll.die)
            @gem_count += @temp * Integer(loot_roll.scale)
            @loot_table += "<td>%s %s</td>" % [ @temp * Integer(loot_roll.scale), loot_roll.sub_type]
          elsif @sub_type == "art"
            @temp = die_roll(loot_roll.die)
            @art_count += @temp * Integer(loot_roll.scale)
            @loot_table += "<td>%s %s</td>" % [ @temp * Integer(loot_roll.scale), loot_roll.sub_type]
          elsif @sub_type == "mundane"
            @temp = die_roll(loot_roll.die)
            @mundane_count += @temp * Integer(loot_roll.scale)
            @loot_table += "<td>%s %s</td>" % [ @temp * Integer(loot_roll.scale), loot_roll.sub_type]
          elsif @sub_type == "minor"
            @temp = die_roll(loot_roll.die)
            @minor_count += @temp * Integer(loot_roll.scale)
            @loot_table += "<td>%s %s</td>" % [ @temp * Integer(loot_roll.scale), loot_roll.sub_type]
          elsif @sub_type == "medium"
            @temp = die_roll(loot_roll.die)
            @medium_count += @temp * Integer(loot_roll.scale)
            @loot_table += "<td>%s %s</td>" % [ @temp * Integer(loot_roll.scale), loot_roll.sub_type]
          elsif @sub_type == "major"
            @temp = die_roll(loot_roll.die)
            @major_count += @temp * Integer(loot_roll.scale)
            @loot_table += "<td>%s %s</td>" % [ @temp * Integer(loot_roll.scale), loot_roll.sub_type]
          end
        end
       
        @loot_table += "</tr>"
      end
    end
    @loot_table += "</table>"
    
    return @loot_table.html_safe, @gem_count, @art_count, @mundane_count, @minor_count, @medium_count, @major_count
  end
  
  def find_gems(gems, roll)
    @gem_table = "<h3>Roll for gems: %d</h3><table><tr><th>name</th><th>value</th></tr>" %roll
    gems.each do |gem|
      if roll >= gem.low and roll <= gem.high
        @gem_table += "<tr><td>%s</td><td>%s</td></tr>" % [gem.name, gem.avg_val]
      end
    end
    
    @gem_table += "</table>"
    return @gem_table.html_safe
  end
  
  def find_art(artwork, roll)
    @art_table = "<h3>Roll for art: %d</h3><table><tr><th>name</th><th>value</th></tr>" %roll
    artwork.each do |art|
      if roll >= art.low and roll <= art.high
        @art_table += "<tr><td>%s</td><td>%s</td></tr>" % [art.name, art.avg_val]
      end
    end
    
    @art_table += "</table>"
    return @art_table.html_safe
  end
  
  def find_mundane(mundane, roll)
    @mundane_table = "<h3>Roll for mundane: %d</h3><table><tr><th>name</th><th>value</th></tr>" %roll
    mundane.each do |m|
      if roll >= m.low and roll <= m.high
        @mundane_table += "<tr><td>%s</td><td>%s</td></tr>" % [m.name, m.avg_val]
      end
    end
    
    @mundane_table += "</table>"
    return @mundane_table.html_safe
  end
  
  def find_minor(minor, roll)
    @minor_table = "<h3>Roll for minor: %d</h3><table><tr><th>name</th><th>value</th></tr>" %roll
    minor.each do |m|
      if roll >= m.low and roll <= m.high
        @minor_table += "<tr><td>%s</td><td>%s</td></tr>" % [m.name, m.avg_val]
      end
    end
    
    @minor_table += "</table>"
    return @minor_table.html_safe
  end
  
  def find_medium(medium, roll)
    @medium_table = "<h3>Roll for medium: %d</h3><table><tr><th>name</th><th>value</th></tr>" %roll
    medium.each do |m|
      if roll >= m.low and roll <= m.high
        @medium_table += "<tr><td>%s</td><td>%s</td></tr>" % [m.name, m.avg_val]
      end
    end
    
    @medium_table += "</table>"
    return @medium_table.html_safe
  end
  
  def find_major(major, roll)
    @major_table = "<h3>Roll for major: %d</h3><table><tr><th>name</th><th>value</th></tr>" %roll
    major.each do |m|
      if roll >= m.low and roll <= m.high
        @major_table += "<tr><td>%s</td><td>%s</td></tr>" % [m.name, m.avg_val]
      end
    end
    
    @major_table += "</table>"
    return @major_table.html_safe
  end
  
  def die_roll(die)
    @num = die[0]
    @results = 0
    for i in 1..Integer(@num)
      @results += do_roll(convert_die(die[1..die.length]))
    end
    return @results
  end
  
  def convert_die(die)
    if die == "d1"
      return 1
    elsif die == "d4"
      return 4
    elsif die == "d6"
      return 6
    elsif die == "d8"
      return 8
    elsif die == "d10"
      return 10
    elsif die == "d12"
      return 12
    elsif die == "d20"
      return 20
    elsif die == "d100"
      return 100
    end
    return 1
  end

end

class Game
  attr_reader :tribes
  
  def initialize(*tribes)
    @tribes = ([] << tribes).flatten!
  end
  
  def add_tribe(tribe)
    @tribes << tribe
  end
  
  def immunity_challenge
    @tribes.sample
  end
  
  def clear_tribes
    @tribes = []
  end
  
  def merge(name)
    new_tribe = Tribe.new(name: name, members: get_all_tribes_members)
    clear_tribes
    @tribes << new_tribe
    return new_tribe
  end

  def individual_immunity_challenge
    tribe = immunity_challenge
    immune = tribe.members.sample
    puts "#{immune.to_s_with_color} won the individual immunity challenge and is safe from elimination."
    tribe.tribal_council(immune: immune)
  end

  private

  def get_all_tribes_members
    members = []
    @tribes.each {|tribe| members += tribe.members}
    return members
  end
end
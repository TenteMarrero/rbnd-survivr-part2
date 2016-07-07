class Game
  attr_reader :tribes
  
  def initialize(*tribes)
    @tribes = tribes
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
    Tribe.new(name: name, members: get_all_tribes_members)
  end

  def individual_immunity_challenge
    tribe = immunity_challenge
    tribe.tribal_council(immune: tribe.select_immune)
  end

  private

  def get_all_tribes_members
    members = []
    @tribes.each {|tribe| members += tribe.members}
    return members
  end
end
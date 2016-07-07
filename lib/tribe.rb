class Tribe
  attr_reader :name, :members
  
  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    puts "Tribe #{@name} created"
  end
  
  def tribal_council(options = {})
    immune = options[:immune]
    delete_one_member immune
  end
  
  def to_s
    @name
  end

  def select_immune
    @members.sample
  end

  private
  def delete_one_member(immune)
    members_to_council = @members.select{|member| member != immune}
    @members.delete(members_to_council.sample)
  end
end
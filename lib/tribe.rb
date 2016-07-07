class Tribe
  attr_reader :name, :members
  attr_accessor :color
  
  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    @color = options[:color] || "black"
    puts "Tribe #{@name.capitalize.send(@color)} created"
  end
  
  def tribal_council(options = {})
    immune = options[:immune]
    puts "#{immune.to_s_with_color} won the individual immunity challenge and is safe from elimination."
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
    member_to_delete = members_to_council.sample
    @members.delete(member_to_delete)
    print_tribal_council_results(member_to_delete)
    return member_to_delete
  end

  def print_tribal_council_results(member_to_delete)
    puts "#{member_to_delete.to_s_with_color} was voted off the island."
    puts "Remaining tribemates on #{@name.capitalize.send(@color)} are: #{print_members}"
  end

  def print_members
    members_capitalized = @members.map {|member| member.to_s_with_color}
    "#{members_capitalized.join(', ')}"
  end
end
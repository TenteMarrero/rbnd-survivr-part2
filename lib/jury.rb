class Jury
  attr_accessor :members
  def initialize
    @members = []
  end
  def add_member(jury_member)
    puts "#{jury_member.to_s_with_color} is member #{@members.length + 1} of the jury"
    @members << jury_member
  end
  def cast_votes(finalists)
    finalists_votes = initialize_finalists_votes finalists
    members.each do |member|
      finalist = finalists.sample
      finalists_votes[finalist] += 1
      puts "#{member.to_s_with_color} votes for #{finalist.to_s_with_color}"
    end
    return finalists_votes
  end
  def report_votes(finalists_votes)
    finalists_votes.each do |contestant, votes|
      puts "#{contestant.to_s_with_color} has #{votes} votes" 
    end
  end
  def announce_winner(finalists_votes)
    winner = finalists_votes.max_by{|contestant, votes| votes}[0]
    puts "And the winner is #{winner.to_s_with_color}!"
    return winner
  end

  private
  def initialize_finalists_votes(finalists)
    Hash[finalists.map{|contestant| [contestant, 0]}]
  end
end
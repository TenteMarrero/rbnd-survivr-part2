class Jury
  attr_accessor :members
  def initialize
    @members = []
  end
  def add_member(jury_member)
    @members << jury_member
  end
  def cast_votes(finalists)
    finalists_votes = initialize_finalists_votes finalists
    members.each do |member|
      finalist_name = finalists.sample.name
      finalists_votes[finalist_name] += 1
      puts "#{member.name} votes for #{finalist_name}"
    end
    return finalists_votes
  end
  def report_votes(finalists_votes)
    finalists_votes.each do |contestant_name, votes|
      puts "#{contestant_name} has #{votes} votes" 
    end
  end
  def announce_winner(finalists_votes)
    winner = finalists_votes.max_by{|contestant_name, votes| votes}[0]
    puts "And the winner is #{winner}"
    return winner
  end

  private
  def initialize_finalists_votes(finalists)
    Hash[finalists.map{|contestant| [contestant.name, 0]}]
  end
end
class Mastermind
  def initialize()
    @numbers = Array((0..9)) 
    @code = []
  end

  private
  def create_code() 
    4.times {@code.push(rand(0..9))}
  end

  public
  def guess()
    create_code()
    p @code
  end


  def create()
  end
end

game = Mastermind.new()
choice = ""
loop do
  p "Do you want to GUESS or CREATE a code? (Enter guess or create)"
  choice = gets.chomp.downcase
  break if choice == "create" || choice == "guess"
end

choice == "create" ? game.create() : game.guess()
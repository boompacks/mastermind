class Mastermind
  def initialize()
    @numbers = Array((0..9)) 
    @computer_code = []
    @user_code = []
    @turn = 0
    @match = false
  end

  private
  def random_code() 
    4.times {@computer_code.push(rand(0..9))}
  end


  def input_code()
    puts "Input the code"
    4.times do   
      loop do
        @user_input = gets.chomp.to_i
        break if @numbers.include? (@user_input)
      end
      @user_code.push(@user_input)
    end
  end


  def get_user_code(codebreaker)
    codebreaker == "player" ? input_code() : random_code()
  end


  def win?()
    @user_code == @computer_code
  end
 
  public
  def guess()
    random_code()
    p @computer_code
    while @turn < 10 && @match == false
      @user_code = []
      get_user_code("player")
      @match = win?()
      @turn += 1
    end
    @match == true ? @message = "Congratulations, you broke the code" : @message = "The codemaster wins"
    p @message
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

# Roba da fare:
 # Quando l'utente deve indovinare il codice, devo chiedere l'input 
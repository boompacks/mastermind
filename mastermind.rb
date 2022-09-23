class Mastermind
  def initialize()
    @numbers = Array((1..6)) 
    @computer_code = []
    @user_code = []
    @turn = 0
    @match = false
  end

  private
  def random_code() 
    4.times {@computer_code.push(rand(0..9))}
  end


  def get_user_code()
    puts "Input the code"
    4.times do   
      loop do
        @user_input = gets.chomp.to_i
        break if @numbers.include? (@user_input)
      end
      @user_code.push(@user_input)
    end
  end


  def win?()
    @user_code == @computer_code
  end


  def give_feedback()
    @correct_positions = 0
    @current_matches = 0
    @temporary_computer_code = @computer_code.dup
    @temporary_user_code = @user_code.dup
    
    # check for correct positions
    4.times {|i| @correct_positions += 1 if @user_code[i] == @computer_code[i] }

    # check for matches
    @temporary_user_code.length.times do |i|
      @temporary_computer_code.length.times do |j| 
        if @temporary_computer_code[j] == @temporary_user_code[i] && @temporary_computer_code[i] != @temporary_user_code[i]
          @current_matches += 1 
          @temporary_computer_code[j] = nil
          @temporary_user_code[i] = -1
          break
        end
      end
    end
    puts "Correct positions: #{@correct_positions} \nMatches: #{@current_matches} "
  end
 
  public
  def guess()
    random_code()
    while @turn < 12 && @match == false
      @user_code = []
      get_user_code()
      @match = win?()
      give_feedback()
      @turn += 1
    end
    @match == true ? @message = "Congratulations, you broke the code" : @message = "The codemaster wins"
    p @message
  end


  def create()
    p "Input the code to break"
    @user_code = get_user_code()
    p @user_code
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
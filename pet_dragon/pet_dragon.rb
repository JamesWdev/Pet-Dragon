class PetDragon

  attr_accessor :health, :energy, :temperment, :affection, :dragon_coins
  
  def initialize
    @health = 3
    @energy = 3
    @temperment = 3
    @affection = 3
    @counter = 0
    @dragon_coins = 10         
  end   

  def statslimit1(number) #Limits stats between 0-10
    min_and_max = number
    if number <= 0
      min_and_max = 0
    elsif
      number >= 10
      min_and_max = 10
    end  
    return min_and_max
  end

  def line  #Adds lines and pauses
    sleep (3)
    puts ""
    puts "-----------------------------------------------------------------------------"
  end
  
  def fighting  #Fight dialog
    puts "Let the fight begin!"
    sleep(2)
    puts "Opponent dragon: You're going down!"
    sleep(1.5)
    puts "Drag: Your face!"
    sleep(1.5)
    puts "..."
    sleep(1.5)
  end

  def victory
    puts "Drag was victorious and took #{@fight_damage} healthpoints of damage!"
    sleep(2)
    puts ""
  end

  def full  #full dialog
      puts ""
      puts "Ugh..."
      sleep (1.5)
      puts "I'm full. No more!"
      line
  end 

  def nom  #Eating dialog
    sleep (0.5)
    print "Drag: Om"
    sleep (1)
    print " nom"
    sleep (1)
    print " nom! "
    line
  end
  
  def broke #Out of money
    puts ""
  puts "Not enough money!"
  puts ""
  sleep (2)  
  puts"Try entering your dragon into fights to earn more dragon coins."
  line
  end

  def start_pet_dragon  #Program will loop unless user inputs "exit"
    while @user_input != "exit"
    @counter += 1       
      if @counter % 3 == 0
        @health -= 1
        @energy -= 1
        @temperment -= 1
        @affection -= 1 
      end      
      if @health <= 0  #Communicates dragon's needs in order of importance 
        puts "Um..."
        sleep (1)
        puts ""       
        puts "Drag: ... so my health is now zero.......bye!"
        sleep (3)
        exit
      elsif @energy <= 0
        puts "I'm hungry. Please feed me dummy!"
        sleep (3)
        @health -= 3
      elsif @temperment <= 0
        puts "I'm not the dragon I use to be. I want to break stuff."
        sleep (3)
        @energy -= 2
      elsif @affection <= 0
        puts "Remember when I told you I wanted to be your dragon?"
        sleep(2)
        puts ""  
        puts "Yeah...I'm not feeling that now.  Cleary you don't know how to show affection."
        sleep(3)
        @temperment -= 2
      end    

    if @counter == 1  #Main dashboard with stats and options
      puts ""   
      puts "Drag: Wasuuuuuuuupppp!!!"
      sleep (1.5)
      puts ""
      puts "Drag: What are we doing today?"
      puts ""
    else
      puts ""
      puts "Drag: Now what?"
      puts ""
    end 
      
      puts "_________________________________________________________________"
      puts "" 
      puts "         *** You have #{@dragon_coins} dragon coins. ***"
      puts ""
      puts "   Health: #{statslimit1(@health)}/10, Energy: #{statslimit1(@energy)}/10, Temperment: #{statslimit1(@temperment)}/10, Affection: #{statslimit1(@affection)}/10."
      puts ""
      puts ""
      puts "       >>> Type 'feed' to feed your dragon!"
      puts "       >>> Type 'exercise' to exercise your dragon!"
      puts "       >>> Type 'play' to play with your dragon!"
      puts "       >>> Type 'pet' to pet your dragon!"
      puts ""
      puts "  =========================================================="
      puts "~~~ Type 'fight' to enter your dragon into a fight competition ~~~"
      puts "  =========================================================="
      puts ""     
      puts "       --- Type 'exit' to leave your dragon ---"
      puts ""
      puts "_________________________________________________________________" 
      @user_input = gets.downcase.chomp

      case @user_input  #Fight options prompt
        when "fight"   
          puts "What level of competition would you like to enter your dragon?"
          puts ""
          puts "Options: 'novice', 'experienced', 'veteran'"
          @fight_input = gets.downcase.chomp
          if @fight_input == "novice"
            @fight_damage = 1 * rand(5)
            @energy = @energy - rand(3)
            @temperment = @temperment - rand(2)
            @affection = @affection - rand(2)
            @health -= @fight_damage
            @dragon_coins += 3
            fighting
            if @health > 0 && !((@counter % 2 == 0) && (@health <= 1))
              victory
              puts "You earned 3 dragon coins!"
              line                
            end
          elsif @fight_input == "experienced"
            @fight_damage = 1 * rand(9)            
            @energy = @energy - rand(4)
            @temperment = @temperment - rand(3)
            @affection = @affection - rand(3)
            @health -= @fight_damage
            @dragon_coins += 6
            fighting
            if @health > 0 && !((@counter % 2 == 0) && (@health <= 1))
              victory
              puts "You earned 6 dragon coins!"
              line
            end  
          elsif @fight_input == "veteran"
            @fight_damage = 1 * rand(15)
            @health -= @fight_damage
            @energy = @energy - rand(5)
            @temperment = @temperment - rand(4)
            @affection = @affection - rand(4)
            @dragon_coins += 9
            fighting
            if (@health > 0)  && !((@counter % 2 == 0) && (@health <= 1))
              victory
              puts "You earned 9 dragon coins!"
              line    
            end
          else
            puts "That's not an option."            
            line          
          end  

        when "feed"  #Food options prompt with cost  
          puts "What would you like to feed your dragon?"
          puts ""
          puts "Options: 'steak' (3 coins), 'bacon' (2 coins), 'fish' (1 coins)?"
          @feed_input = gets.downcase.chomp

          if (@health >= 10) && (@energy >= 10)
            full
          elsif (@feed_input == "steak") && (@dragon_coins >= 3)
            @health += 3
            @energy += 3
            @temperment += 1
            @affection += 1
            @dragon_coins -= 3
            puts "Drag: Yeaaaaaah!  Steak my faaav!"
            nom
          elsif @feed_input == "bacon" && (@dragon_coins >= 2)
            @health += 2
            @energy += 2
            @temperment +=1
            @affection +=1
            @dragon_coins -= 2
            puts "Drag: Bacon a day keeps the doctor away!"
            nom            
          elsif @feed_input == "fish" && (@dragon_coins >= 1)
            @health += 1
            @energy += 1
            @temperment -=1
            @affection -=1
            @dragon_coins -= 1
            puts "Drag: Ewww...I thought you loved me!"
            sleep (1)
            print "Drag: sniff*"
            sleep (1)
            print " sniff*"
            sleep (1)
            print " gulp*"
            sleep (2)
            print " ...Disgusting!"
            line  #Not enough money for food dialog
          elsif (@feed_input == "steak") && (@dragon_coins < 3)
            broke
          elsif (@feed_input == "bacon") && (@dragon_coins < 2)
            broke
          elsif (@feed_input == "fish") && (@dragon_coins < 1)
            broke   
          else
            puts "That's not on the menu." 
            line  
          end  
        when "exercise"  #Exercise prompt
          puts "How would you like to exercise your dragon?"
          puts ""
          puts "Options: flyathon, dragon-press, fire?"
          @exercise_input = gets.downcase.chomp
          if @exercise_input == "flyathon"
            @health += 2
            @energy -= 2
            @temperment +=2
            @affection +=1
            sleep (0.5)
            puts "Drag: Wings feel good and a new personal record!"            
            line
          elsif @exercise_input == "dragon-press"   
            @health += 1
            @energy -= 1
            @temperment +=1
            @affection +=1
            sleep (0.5)
            puts "Drag: Gotta get them gains!"             
            line
          elsif @exercise_input == "fire"
            @energy -= 2
            @temperment -=2
            @affection +=3
            sleep (0.5)
            puts "Drag: Fire is everything!"             
            line
          else
            puts "That's not how we train here."
            line  
          end
        when "play"  #Game prompt
          puts "What games would you like to play with your dragon?"
          puts ""
          puts "Options: Burn-the-village, Knight-fight, Halo?"
          @play_input = gets.downcase.chomp
          if @play_input == "burn-the-village"
            @energy -= 1         
            @temperment +=1
            @affection +=3
            sleep (0.5)
            puts "Drag: Yay! That was so much fun!"             
            line
          elsif @play_input == "knight-fight"   
            @energy -= 1
            @temperment +=2
            @affection +=2
            sleep (0.5)
            puts "Drag: Dragons always win!"             
            line
          elsif @play_input == "halo"
            @temperment +=3
            sleep (0.5)
            puts "Drag: Wana play split screen!?"             
            line
          else
            puts "Thats not an option here."
            line 
          end
        when "pet"
          @affection +=1
          puts "Belly scatches are the best!"
          line
        when "exit"  #exit or mistype dialog
          puts "Goodbye!"          
        else
          puts "That's not an option."
          line
      end    
    end
  end    
end

pet_dragon = PetDragon.new
pet_dragon.start_pet_dragon

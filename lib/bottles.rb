class Bottles
  def verse(number)
    refrain(number)
  end

  def verses(starting, ending)
    starting.downto(ending).collect { |i| verse(i) }.join("\n")
  end

  def song
    verses(99, 0) # VERSE NUMBER vs BUTTLE NUMBER in `verse`
  end

  # def bottle_number_for(number)
  #   case number
  #    when 0
  #     BottleNumber0
  #    when 1
  #     BottleNumber1
  #   else
  #     BottleNumber
  #   end.new(number)
  # end

  private

  # All methods take a `number` parameter

  def refrain(number)
    button_number = BottleNumber.for(number)
    next_bottle_number = BottleNumber.for(button_number.successor)
    # Goal: next_bottle_number = bottle_number.successor :-)

    "#{button_number} of beer on the wall, ".capitalize +
    "#{button_number} of beer.\n" +
    "#{button_number.action}, " +
    "#{next_bottle_number} of beer on the wall.\n"
  end
end

class BottleNumber
  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(number)
  end

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def container
    "bottles"
  end

  def pronoun
    "one"
  end

  def quantity
    number.to_s
  end

  def successor
    number - 1
  end
end

class BottleNumber0 < BottleNumber
  def quantity
    "no more"
  end

  def action
    "Go to the store and buy some more"
  end

  def successor
    99
  end
end

class BottleNumber1 < BottleNumber

  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end
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

  private

  # All methods take a `number` parameter

  def refrain(number)
    button_number = BottleNumber.new(number)
    next_bottle_number = BottleNumber.new(button_number.successor)

    "#{button_number} of beer on the wall, ".capitalize +
    "#{button_number} of beer.\n" +
    "#{button_number.action}, " +
    "#{next_bottle_number} of beer on the wall.\n"
  end
end


class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def action
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def container
    number == 1 ? "bottle" : "bottles"
  end

  def pronoun
    number == 1 ? "it" : "one"
  end

  def quantity
    number == 0 ? "no more" : number.to_s
  end

  def successor
    number == 0 ? 99 : number - 1
  end
end
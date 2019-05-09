class Bottles
  def initialize
  end

  def verse(number)
    refrain(number)
  end

  def verses(starting, ending)
    starting.downto(ending).collect { |i| verse(i) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def refrain(number)
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
    "#{quantity(number)} #{container(number)} of beer.\n" +
    "#{action(number)}, " +
    "#{quantity(successor(number))} #{container(number - 1)} of beer on the wall.\n"
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def container(number)
    number == 1 ? "bottle" : "bottles"
  end

  def pronoun(number)
    number == 1 ? "it" : "one"
  end

  def quantity(number = 0)
    number == 0 ? "no more" : number.to_s
  end

  def successor(number)
    number == 0 ? 99 : number - 1
  end
end

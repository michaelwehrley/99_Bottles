class Bottles
  def initialize
  end

  def verse(number)
    <<~HEREDOC
      #{refrain(number)}
    HEREDOC
  end

  # def verses(verse1, verse2)
  #   counting = [*verse2..verse1]
  #   content = ""
  #   counting.reverse.each_with_index do |v, i|
  #     content += verse(v)
  #     content += "\n" if i < counting.length - 1
  #   end
  #   content
  # end

  def verses(starting, ending)
    starting.downto(ending).collect { |i| verse(i) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def refrain(number)
    case number
    when 0
      "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
      "#{quantity(number)} #{container(number)} of beer.\n" +
      "#{action(number)}, " +
      "#{quantity(99)} #{container(99)} of beer on the wall."
    else
      "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
      "#{quantity(number)} #{container(number)} of beer.\n" +
      "#{action(number)}, " +
      "#{quantity(number - 1)} #{container(number - 1)} of beer on the wall."
    end
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
end

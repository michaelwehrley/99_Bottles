class Bottles
  def initialize
  end

  def verse(number)
    <<~HEREDOC
      #{chorus(number)}
      #{refrain(number)}
    HEREDOC
  end

  def verses(verse1, verse2)
    counting = [*verse2..verse1]
    content = ""
    counting.reverse.each_with_index do |v, i|
      content += verse(v)
      content += "\n" if i < counting.length - 1
    end
    content
  end

  def song
    verses(99, 0)
  end

  private

  def chorus(number)
    case number
    when 0
      "No more bottles of beer on the wall, no more bottles of beer."
    when 1
      "#{number} bottle of beer on the wall, #{number} bottle of beer."
    else
      "#{number} bottles of beer on the wall, #{number} bottles of beer."
    end
  end

  def refrain(number)
    case number
    when 0
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    when 1
      "Take it down and pass it around, no more bottles of beer on the wall."
    when 2
      "Take one down and pass it around, 1 bottle of beer on the wall."
    else
      "Take one down and pass it around, #{number - 1} bottles of beer on the wall."
    end
  end
end

# start_count = 99
# end_count = 1

# def bottle_count_text(bottle_count)
#   bottle_count == 1 ? "#{bottle_count} bottle" : "#{bottle_count} bottles"
# end

# [*end_count..start_count].reverse.each do |x|
#   next_bottle_count_text = bottle_count_text(x - 1)
#   current_bottle_count_text = bottle_count_text(x)

#   puts "#{current_bottle_count_text} of beer on the wall, #{current_bottle_count_text} of beer. Take one down and pass it around, #{next_bottle_count_text} of beer on the wall."
# end

# puts "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, #{start_count} bottles of beer on the wall."

class BottleSong
  attr_reader :start_count, :end_count

  def initialize(start_count:, end_count:)
    @start_count = start_count
    @end_count = end_count
  end

  def sing
    [*end_count..start_count].reverse.each do |x|
      next_bottle_count_text = bottle_count_text(x - 1)
      current_bottle_count_text = bottle_count_text(x)

      puts "#{current_bottle_count_text} of beer on the wall, #{current_bottle_count_text} of beer. Take one down and pass it around, #{next_bottle_count_text} of beer on the wall."
    end

    puts "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, #{start_count} bottles of beer on the wall."
  end

  private

  def bottle_count_text(bottle_count)
    "#{bottle_count} #{pluralize(bottle_count)}"
  end

  def pluralize(bottle_count)
    bottle_count == 1 ? "bottle" : "bottles"
  end
end

BottleSong.new(start_count: 99, end_count: 1).sing
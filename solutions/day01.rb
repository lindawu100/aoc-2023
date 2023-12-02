input = File.read("day01_data.txt").lines

# part 1: success solution
# arr = input.map do |str|
#   num_str = str.gsub(/[^0-9]/, '')
#   [num_str[0], num_str[-1]].join.to_i
# end
#
# puts arr.sum

h = {'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}
#
# part 2: success solution
b = input.map do |str|
  # also work for part 1, just keep \d
  # arr = str.scan(/(?=(\d))/).flatten
  arr = str.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).flatten
  [arr.first, arr.last].map do |x|
    h.values.map(&:to_s).include?(x) ? x : h[x]
  end.join.to_i
end
puts b.sum

# fail solution
# arr = input.map do |str|
#   str.to_enum(:scan, /(\d|one|two|three|four|five|six|seven|eight|night)/i).map do |m,|
#     {$`.size => m}
#   end.inject(:merge)
# end
#
# expected output for arr:
# [
#     [0] {
#         1 => "eight",
#         6 => "one"
#     },
#     [1] {
#          5 => "four",
#         14 => "seven"
#     }
# ]

# b = arr.map do |hash|
#   min = hash[hash.keys.min]
#   max = hash[hash.keys.max]
#
#   [min, max].map do |x|
#     h.values.map(&:to_s).include?(x) ? x : h[x]
#   end.join
# end.map(&:to_i)
# puts b.sum

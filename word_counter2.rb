filename = ARGV[0]
n = ARGV[1].to_i

def word_counter(filename, n)
  puts "Finding the #{n} most common words in #{filename}..."
  text = File.read(filename)
  stripped_text = text.downcase.gsub(/[^a-z'\s]/, '').split(' ')
  frequency = Hash.new
  stripped_text.each do |word|
    frequency[word] = stripped_text.count(word)
  end
  arrayed = frequency.sort_by {|word, count| count}.reverse.slice(0...n)
  arrayed.each {|word, count| puts "#{word} #{count}"}

end

word_counter(filename, n)

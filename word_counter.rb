require 'pry'
file = ARGV[0]
top_words = ARGV[1].to_i
text = File.read(file).downcase


def split(text, top_words)

  stop_word = File.read("stop_words.txt").split("\n")
  words_array = text.downcase.gsub(/[^a-z'\s]/, '').split(' ')
 words_array.each do |word|
    counter = 0
  while counter < stop_word.length
      if word == stop_word[counter]
        words_array.delete(word)
      end
      counter += 1
    end
  end
  word_count = {}
  words_array.each do |wrd|
   if word_count.key?(wrd)
      word_count[wrd]+=1
   else
      word_count[wrd]=1
   end
 end
   top_word_counts = word_count.sort_by{|k,v| v}.reverse
   x = 0
   while (x != top_words)

    puts "#{top_word_counts[x][0]} : #{top_word_counts[x][1]}"
      x+=1
   end

end

  split(text,top_words)


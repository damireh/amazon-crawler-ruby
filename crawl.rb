#!/usr/bin/ruby

require_relative "amazon"

book = Amazon.new(ARGV[0])

puts "--------------------------"
puts "Title:    #{book.title}"
puts "Author:   #{book.author}"
puts "Price:    #{book.price}"
puts "ISBN:     #{book.isbn_numbers}"
puts "Language: #{book.language}"


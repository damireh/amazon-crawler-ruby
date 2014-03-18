## Amazon Product Crawler

This script takes in an Amazon product URL (only books for now) and returns information about the book. Title, author, price, ISBN numbers and language.

#### System dependencies

	nokogiri

#### How to run the test suite

	rspec .

#### How to use

Pass in a URL to the `crawl.rb` script

	./crawl.rb <URL>

#### Example

	./crawl.rb "http://www.amazon.com/dp/0446310786"
	--------------------------
	Title:    To Kill a Mockingbird
	Author:   Harper Lee
	Price:    {"Library Binding"=>"$14.21", "Paperback"=>"$10.30", "Mass Market Paperback"=>"$4.99", "Audio CD"=>"$21.74"}
	ISBN:     {"ISBN-10"=>"0446310786", "ISBN-13"=>"978-0446310789"}
	Language: English

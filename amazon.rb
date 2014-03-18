require "nokogiri"
require "open-uri"
require "uri"

class Amazon
  def initialize url
    raise ArgumentError.new("Invalid URL") unless url =~ URI::regexp

    @url = url
    @response = Nokogiri::HTML open(url)
  end

  def title
    @title ||= @response.css("span#productTitle").text
  end

  def author
    author_element = @response.css("span.author a.a-link-normal")

    if author_element[3].nil?
      @author ||= author_element.text
    else
      @author ||= author_element[3].children.text
    end
  end

  def price
    prices_array = @response.css("div#tmmSwatches ul li a span").map{|node| node.text.gsub("\n\t", "").strip}.uniq.reject{|element| element == "from"}
    @price ||= Hash[prices_array.each_slice(2).to_a]
  end

  def isbn_numbers
    @isbn_numbers ||= Hash[@response.css("table#productDetailsTable li").map{|node| node.text.split(": ")}.select{|key, value| key.include? "ISBN" }]
  end

  def language
    @language ||= @response.css("table#productDetailsTable li").map{|node| node.text.split(": ")}.select{|key, value| key == "Language" }[0][1]
  end
end

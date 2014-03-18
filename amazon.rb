require "nokogiri"
require "open-uri"

class Amazon
  def initialize url
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
    prices_array = @response.css("div#tmmSwatches ul li a span").map{|node| node.text.gsub("\n\t", "").strip}.uniq
    @price ||= Hash[prices_array.each_slice(2).to_a].reject!{|key, value| value.nil?}
  end

  def isbn_numbers
    isbn = @response.css("table#productDetailsTable li").map(&:text)
    @isbn_numbers ||= [isbn[3], isbn[4]]
  end

  def language
    @language ||= @response.css("table#productDetailsTable li").map(&:text)[2]
  end
end

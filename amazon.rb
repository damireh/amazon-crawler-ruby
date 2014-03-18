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
    @author ||= @response.css("span.author a.a-link-normal").text
  end

  def price
    prices_array = @response.css("div#tmmSwatches ul li a span").map{|node| node.text.gsub("\n\t", "").strip}.uniq
    @price ||= Hash[prices_array.each_slice(2).to_a].reject!{|key, value| value.nil?}
  end
end

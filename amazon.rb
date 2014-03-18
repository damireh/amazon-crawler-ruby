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
end

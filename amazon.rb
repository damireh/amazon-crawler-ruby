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
end

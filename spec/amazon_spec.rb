require_relative "../amazon"

URL = "http://www.amazon.com/gp/product/0465050654"

describe Amazon do
  before :all do
    @book = Amazon.new URL
  end

  it "accepts an Amazon product URL"

  describe "#title" do
    it "returns book title" do
      expect(@book.title).to eq "The Design of Everyday Things: Revised and Expanded Edition"
    end
  end

  it "returns book author(s)" do
    expect(@book.author).to eq "Don Norman"
  end

  it "returns book prices (kindle, paperback, etc...)"
  it "returns all possible ISBN numbers"
  it "returns book language(s)"
end

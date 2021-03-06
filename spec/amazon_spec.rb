require_relative "../amazon"

describe Amazon do
  before :all do
    @book = Amazon.new "http://www.amazon.com/gp/product/0465050654"
  end

  it "should raise an exception if URL is not valid" do
    expect{ Amazon.new("error") }.to raise_error(ArgumentError)
  end

  describe "#title" do
    it "returns book title" do
      expect(@book.title).to eq "The Design of Everyday Things: Revised and Expanded Edition"
    end
  end

  it "returns book author(s)" do
    expect(@book.author).to eq "Don Norman"
  end

  it "returns book prices (kindle, paperback, etc...)" do
    expect(@book.price.to_s).to eq "{\"Kindle\"=>\"$9.99\", \"Paperback\"=>\"$11.37\"}"
  end

  it "returns all possible ISBN numbers" do
    expect(@book.isbn_numbers.to_s).to eq "{\"ISBN-10\"=>\"0465050654\", \"ISBN-13\"=>\"978-0465050659\"}"
  end

  it "returns book language(s)" do
    expect(@book.language).to eq "English"
  end
end

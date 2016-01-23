require 'nokogiri'
require 'open-uri'

class Appearance
  attr_reader :url

  UNNECESSARY_TAGS = ['script', 'noscript', 'link', 'style', 'meta'].freeze

  # Initialize a new Appearance object
  #
  # url - The URL address
  #
  # Examples
  #
  #   Appearance.new('http://apple.com')
  #
  # Returns the Object
  def initialize(url)
    @url = url
  end

  # Display the word frequency in a web
  #
  # word  - A word that you want to know the number of occurrences in web page.
  #
  # Examples
  #
  #   web = Appearance.new('http://apple.com')
  #   web.word_frequency('iphone')
  #   # => 100
  #
  # Returns the Integer
  def word_frequency(word)
    occurrences[word]
  end

  # Display letter frequency in a web
  #
  # letter  - A letter that you want to know the number of occurrences in web page.
  #
  # Examples
  #
  #   web = Appearance.new('http://apple.com')
  #   web.letter_frequency('s')
  #   # => 120
  #
  # Return the Integer
  def letter_frequency(letter)
    inner_word.count(letter.downcase)
  end

  # Display occurrences of all words in a web page.
  #
  # Examples
  #
  #   word = Appearance.new('http://apple.com')
  #   word.occurrences
  #   # => { "the"=>151, "api"=>63 }
  #
  # Returns the Hash
  def occurrences
    Hash[
      inner_word.scan(/\w+/).group_by(&:downcase).map do |wrd, inst|
        [wrd, inst.length]
      end.sort_by(&:last).reverse
    ]
  end

  # Display the element frequency in a rss link
  #
  # element - An element in RSS structure
  #
  # Examples
  #
  #   rss = Appearance.new('http://rubyweekly.com/rss/18dj53ah')
  #   rss.element_frequency('pubDate')
  #   # => 100
  #
  # Returns the Integer
  def element_frequency(element)
    rss_feed.css(element).count
  end

  private

    # Private: Display the inner text of html tags in web page.
    #
    # Examples
    #
    #   word = Appearance.new('http://github.com')
    #   inner_word
    #   # => "\n  \n\n\n  \n    \n      Github:Developer\n"
    #
    # Returns the String
    def inner_word
      html_content = Rails.cache.fetch("html", :expires_in => 1.day) do
        open(url).read
      end
      html = Nokogiri::HTML(html_content)

      # Remove unnecessary tags
      UNNECESSARY_TAGS.each { |tag| html.css(tag).remove }

      html.at('body').inner_text
    end

    # Private: Parse XML in RSS url
    #
    # Examples
    #
    #   rss = Appearance.new('http://rubyweekly.com/rss/18dj53ah')
    #   rss_feed
    #
    # Returns Nokogiri::XML object
    def rss_feed
      xml = Rails.cache.fetch("xml", :expires_in => 1.day) do
        open(url).read
      end

      Nokogiri::XML(xml)
    end
end

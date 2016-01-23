require 'rails_helper'

RSpec.describe Appearance do
  let(:web_page) { File.new('spec/fixtures/example.html') }
  let(:rss_page) { File.new('spec/fixtures/rss_example.xml') }

  let(:wrong_web_page) { File.new('spec/fixtures/wrong_example.html') }
  let(:wrong_rss_page) { File.new('spec/fixtures/wrong_rss_example.html') }

  let(:web) { Appearance.new(web_page) }
  let(:rss) { Appearance.new(rss_page) }

  context '.new' do
    it 'returns a new Appearance object' do
      expect(web.url).to eq web_page
    end
  end

  context '.word_frequency' do
    it 'returns the word frequency in the web' do
      word = web.word_frequency('class')
      expect(word).to eq 2
    end

    it 'returns nil if the word is not exist in the web' do
      word = web.word_frequency('vietnam')
      expect(word).to be_nil
    end

    it 'raises an error if the url is wrong' do
      expect do
        Appearance.new(wrong_web_page).word_frequency('test')
      end.to raise_error 'No such file or directory @ rb_sysopen - spec/fixtures/wrong_example.html'
    end
  end

  context '.letter_frequency' do
    it 'returns the letter frequency in the web' do
      letter = web.letter_frequency('a')
      expect(letter).to eq 11
    end

    it 'returns zero if the letter is not exist' do
      letter = web.letter_frequency('z')
      expect(letter).to eq 0
    end

    it 'raises an error if the url is wrong' do
      expect do
        Appearance.new(wrong_web_page).letter_frequency('z')
      end.to raise_error 'No such file or directory @ rb_sysopen - spec/fixtures/wrong_example.html'
    end
  end

  context '.element_frequency' do
    it 'returns the element frequency in the rss' do
      element = rss.element_frequency('pubDate')
      expect(element).to eq 3
    end

    it 'returns zero if the element is not exist' do
      element = rss.element_frequency('pubDates')
      expect(element).to eq 0
    end

    it 'raises an error if the rss link is wrong' do
      expect do
        Appearance.new(wrong_rss_page).element_frequency('dates')
      end.to raise_error 'No such file or directory @ rb_sysopen - spec/fixtures/wrong_rss_example.html'
    end
  end

  context '.occurrences' do
    it 'returns the Hash of number of words in a web page' do
      occurrences = web.occurrences
      expect(occurrences).to an_instance_of(Hash)
    end

    it 'raises an error if the web link is wrong' do
      expect do
        Appearance.new(wrong_web_page).occurrences
      end.to raise_error 'No such file or directory @ rb_sysopen - spec/fixtures/wrong_example.html'
    end
  end
end

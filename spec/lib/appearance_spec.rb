require 'rails_helper'

RSpec.describe Appearance do
  include_context 'appearances_contents'

  let(:web) { Appearance.new('hello.com') }
  let(:rss) { Appearance.new('rss.com') }
  let(:fail_url) { Appearance.new('fail.com') }

  context '.new' do
    it 'returns a new Appearance object' do
      expect(web.url).to eq 'hello.com'
      expect(rss.url).to eq 'rss.com'
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

    it 'raises NoMethodError if the url is wrong' do
      expect do
        fail_url.word_frequency('test')
      end.to raise_error(NoMethodError)
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

    it 'raises NoMethodError if the url is wrong' do
      expect do
        fail_url.letter_frequency('z')
      end.to raise_error(NoMethodError)
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
  end

  context '.occurrences' do
    it 'returns the Hash of number of words in a web page' do
      occurrences = web.occurrences
      expect(occurrences).to an_instance_of(Hash)
    end

    it 'raises NoMethodError if the url is wrong' do
      expect do
        fail_url.occurrences
      end.to raise_error(NoMethodError)
    end
  end
end

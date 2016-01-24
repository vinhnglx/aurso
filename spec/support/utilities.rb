shared_context 'appearances' do
  before do
    allow_any_instance_of(Appearance).to receive(:letter_frequency).and_return(400)
    allow_any_instance_of(Appearance).to receive(:word_frequency).and_return(20)
    allow_any_instance_of(Appearance).to receive(:element_frequency).and_return(4)
  end
end

shared_context 'html_contents' do
  before do
    stub_request(:get, "hello.com").
      with(headers: {'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus'}).
      to_return(status: 200, body: File.new('spec/fixtures/example.html').read, headers: {})

    stub_request(:get, "rss.com").
      with(headers: {'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus'}).
      to_return(status: 200, body: File.new('spec/fixtures/rss_example.xml').read, headers: {})

    stub_request(:get, "fail.com").
      with(headers: {'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus'}).
      to_return(status: 200, body: "", headers: {})
  end
end

shared_context 'appearances' do
  before do
    allow_any_instance_of(Appearance).to receive(:letter_frequency).and_return(400)
    allow_any_instance_of(Appearance).to receive(:word_frequency).and_return(20)
    allow_any_instance_of(Appearance).to receive(:element_frequency).and_return(4)
  end
end

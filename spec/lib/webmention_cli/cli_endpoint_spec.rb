describe WebmentionCLI::CLI, '.endpoint' do
  context 'when url is invalid' do
    it 'raises a MalformattedArgumentError' do
      message = "ERROR: Expected 'http:' to be an absolute URI (e.g. https://example.com)"

      expect { described_class.new.endpoint('http:') }.to raise_error(Thor::MalformattedArgumentError, message)
    end
  end
end

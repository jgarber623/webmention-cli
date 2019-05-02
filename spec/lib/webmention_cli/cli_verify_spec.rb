describe WebmentionCLI::CLI, '.verify' do
  let(:url) { 'https://example.com/post/100' }

  context 'when source is invalid' do
    it 'raises a MalformattedArgumentError' do
      message = "ERROR: Expected '/foo' and '#{url}' to be absolute URLs (e.g. https://example.com)"

      expect { described_class.new.verify('/foo', url) }.to raise_error(Thor::MalformattedArgumentError, message)
    end
  end

  context 'when target is invalid' do
    it 'raises a MalformattedArgumentError' do
      message = "ERROR: Expected '#{url}' and '/foo' to be absolute URLs (e.g. https://example.com)"

      expect { described_class.new.verify(url, '/foo') }.to raise_error(Thor::MalformattedArgumentError, message)
    end
  end
end

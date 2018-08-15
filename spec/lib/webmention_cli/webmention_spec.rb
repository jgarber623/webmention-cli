describe WebmentionCLI::Webmention do
  describe '#exit_on_failure?' do
    it 'returns true' do
      expect(described_class.exit_on_failure?).to be(true)
    end
  end

  describe '.endpoint' do
    context 'when url is invalid' do
      it 'raises a MalformattedArgumentError' do
        message = "ERROR: Expected 'http:' to be an absolute URI (e.g. https://example.com)"

        expect { described_class.new.endpoint('http:') }.to raise_error(Thor::MalformattedArgumentError, message)
      end
    end
  end

  describe '.verify' do
    let(:url) { 'https://example.com/post/100' }

    context 'when source is invalid' do
      it 'raises a MalformattedArgumentError' do
        message = "ERROR: Expected '/foo' and '#{url}' to be absolute URIs (e.g. https://example.com)"

        expect { described_class.new.verify('/foo', url) }.to raise_error(Thor::MalformattedArgumentError, message)
      end
    end

    context 'when target is invalid' do
      it 'raises a MalformattedArgumentError' do
        message = "ERROR: Expected '#{url}' and '/foo' to be absolute URIs (e.g. https://example.com)"

        expect { described_class.new.verify(url, '/foo') }.to raise_error(Thor::MalformattedArgumentError, message)
      end
    end
  end
end

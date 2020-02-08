describe Webmention::CLI::Commands::Verify, '#run' do
  subject(:command) { described_class.new(source, target, strict) }

  let(:source) { 'https://source.example.com' }
  let(:target) { 'https://target.example.com' }
  let(:strict) { true }

  context 'when given an invalid argument' do
    let(:source) { 'foo' }

    it 'raises an ArgumentError' do
      expect { command.run }.to raise_error(Webmention::CLI::ArgumentError, 'source must be an absolute URI (e.g. https://example.com/post/100)')
    end
  end

  context 'when an exception occurs' do
    before do
      stub_request(:get, source).to_timeout
    end

    it 'raises a WebmentionVerificationError' do
      expect { command.run }.to raise_error(Webmention::CLI::WebmentionVerificationError, 'connection error: Operation timed out')
    end
  end
end

RSpec.describe Webmention::CLI::Commands::Send, '#run' do
  subject(:command) { described_class.new(source, target) }

  let(:source) { 'https://source.example.com' }
  let(:target) { 'https://target.example.com' }

  context 'when given an invalid argument' do
    let(:source) { 'foo' }

    it 'raises an ArgumentError' do
      expect { command.run }.to raise_error(Webmention::CLI::ArgumentError, 'source must be an absolute URL (e.g. https://example.com)')
    end
  end

  context 'when an exception occurs' do
    before do
      stub_request(:get, target).to_timeout
    end

    it 'raises a WebmentionSendError' do
      expect { command.run }.to raise_error(Webmention::CLI::WebmentionSendError, /^connection error:/)
    end
  end
end

RSpec.describe Webmention::CLI::Commands::Endpoint, '#run' do
  subject(:command) { described_class.new(url) }

  let(:url) { 'https://example.com' }

  context 'when given an invalid argument' do
    let(:url) { 'foo' }

    it 'raises an ArgumentError' do
      expect { command.run }.to raise_error(Webmention::CLI::ArgumentError, 'url (foo) must be an absolute URL (e.g. https://example.com)')
    end
  end

  context 'when an exception occurs' do
    before do
      stub_request(:get, url).to_timeout
    end

    it 'raises a WebmentionEndpointError' do
      expect { command.run }.to raise_error(Webmention::CLI::WebmentionEndpointError, /^connection error:/)
    end
  end
end

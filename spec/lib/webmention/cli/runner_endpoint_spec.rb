# frozen_string_literal: true

RSpec.describe Webmention::CLI::Runner, "#endpoint" do
  subject(:cmd) { described_class.new.endpoint(url) }

  let(:url) { "https://jgarber.example/post/100" }

  context "when no Webmention endpoint found" do
    before do
      stub_request(:get, url).to_return(
        body: "<html><body>Hello, world!</body></html>",
        headers: {
          "Content-Type": "text/html"
        }
      )
    end

    it "raises SystemExit" do
      expect { cmd }.to raise_error(SystemExit)
    end
  end

  context "when Webmention endpoint found" do
    let(:webmention_endpoint) { "https://jgarber.example/webmention" }

    before do
      stub_request(:get, url).to_return(
        headers: {
          Link: %(<#{webmention_endpoint}>; rel="webmention")
        }
      )
    end

    it "prints the Webmention endpoint" do
      expect { cmd }.to output("#{webmention_endpoint}\n").to_stdout
    end
  end
end

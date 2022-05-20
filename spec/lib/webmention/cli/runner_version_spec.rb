# frozen_string_literal: true

RSpec.describe Webmention::CLI::Runner, '#version' do
  subject(:cmd) { described_class.new.version }

  it 'prints version information' do
    expect { cmd }.to output("webmention-cli version #{Webmention::CLI::VERSION}\n").to_stdout
  end
end

describe WebmentionCLI::CLI, '#exit_on_failure?' do
  it 'returns true' do
    expect(described_class.exit_on_failure?).to be(true)
  end
end

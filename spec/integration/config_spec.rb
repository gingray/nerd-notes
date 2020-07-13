RSpec.describe "`nerd-notes config` command", type: :cli do
  it "executes `nerd-notes help config` command successfully" do
    output = `nerd-notes help config`
    expected_output = <<-OUT
Usage:
  nerd-notes config

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end

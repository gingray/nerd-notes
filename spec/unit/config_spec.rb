require 'nerd/notes/commands/config'

RSpec.describe Nerd::Notes::Commands::Config do
  it "executes `config` command successfully" do
    output = StringIO.new
    options = {}
    command = Nerd::Notes::Commands::Config.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end

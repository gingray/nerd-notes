RSpec.describe Nerd::Notes do
  it "has a version number" do
    binding.pry
    expect(Nerd::Notes::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end

require "test_helper"

describe Phase do
  let(:phase) { Phase.new }

  it "must be valid" do
    value(phase).must_be :valid?
  end
end

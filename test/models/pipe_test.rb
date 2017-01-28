require "test_helper"

describe Pipe do
  let(:pipe) { Pipe.new }

  it "must be valid" do
    value(pipe).must_be :valid?
  end
end

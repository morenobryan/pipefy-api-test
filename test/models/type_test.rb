require "test_helper"

describe Type do
  let(:type) { Type.new }

  it "must be valid" do
    value(type).must_be :valid?
  end
end

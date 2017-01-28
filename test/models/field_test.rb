require "test_helper"

describe Field do
  let(:field) { Field.new }

  it "must be valid" do
    value(field).must_be :valid?
  end
end

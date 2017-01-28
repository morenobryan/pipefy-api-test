require "test_helper"

describe FieldValue do
  let(:field_value) { FieldValue.new }

  it "must be valid" do
    value(field_value).must_be :valid?
  end
end

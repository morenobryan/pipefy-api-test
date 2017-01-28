require "test_helper"

describe FieldValuesController do
  let(:field_value) { field_values :one }

  it "gets index" do
    get field_values_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_field_value_url
    value(response).must_be :success?
  end

  it "creates field_value" do
    expect {
      post field_values_url, params: { field_value: { card_id: field_value.card_id, display_value: field_value.display_value, field_id: field_value.field_id, value: field_value.value } }
    }.must_change "FieldValue.count"

    must_redirect_to field_value_path(FieldValue.last)
  end

  it "shows field_value" do
    get field_value_url(field_value)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_field_value_url(field_value)
    value(response).must_be :success?
  end

  it "updates field_value" do
    patch field_value_url(field_value), params: { field_value: { card_id: field_value.card_id, display_value: field_value.display_value, field_id: field_value.field_id, value: field_value.value } }
    must_redirect_to field_value_path(field_value)
  end

  it "destroys field_value" do
    expect {
      delete field_value_url(field_value)
    }.must_change "FieldValue.count", -1

    must_redirect_to field_values_path
  end
end

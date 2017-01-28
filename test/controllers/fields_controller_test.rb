require "test_helper"

describe FieldsController do
  let(:field) { fields :one }

  it "gets index" do
    get fields_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_field_url
    value(response).must_be :success?
  end

  it "creates field" do
    expect {
      post fields_url, params: { field: { default_value: field.default_value, index: field.index, label: field.label, phase_id: field.phase_id, type_id: field.type_id } }
    }.must_change "Field.count"

    must_redirect_to field_path(Field.last)
  end

  it "shows field" do
    get field_url(field)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_field_url(field)
    value(response).must_be :success?
  end

  it "updates field" do
    patch field_url(field), params: { field: { default_value: field.default_value, index: field.index, label: field.label, phase_id: field.phase_id, type_id: field.type_id } }
    must_redirect_to field_path(field)
  end

  it "destroys field" do
    expect {
      delete field_url(field)
    }.must_change "Field.count", -1

    must_redirect_to fields_path
  end
end

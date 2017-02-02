require 'test_helper'

describe FieldValue do
  let(:field_value) do
    FieldValue.new(
      id: 7_676_067,
      field_id: 2_846_632,
      value: 'Esse foi o João que postou!',
      display_value: 'Esse foi o João que postou!',
      created_at: '2017-01-23T21:10:48.533-02:00',
      updated_at: '2017-01-23T21:17:22.424-02:00',
      card_id: 1_605_641
    )
  end

  let(:existing_field_value) do
    field_value.assign_attributes(value: 'Test of change')
    field_value
  end

  let(:field_value_response) do
    {
      id: 7_676_067,
      field_id: 2_846_632,
      value: 'Esse foi o João que postou!',
      display_value: 'Esse foi o João que postou!',
      created_at: '2017-01-23T21:10:48.533-02:00',
      updated_at: '2017-01-23T21:17:22.424-02:00',
      card: {
        id: 1_605_641,
        due_date: nil,
        labels: [],
        assignees: []
      }
    }.to_json
  end

  before do
    stub_request(:get, 'http://app.pipefy.com/card_field_values/7676067.json')
      .to_return(body: field_value_response)

    create(:phase, id: 1_065_145)
    create(:card, id: 1_605_641, current_phase_id: 1_065_145)
    create(:field, id: 2_846_632, phase_id: 1_065_145)
  end

  it 'must fetch an field_value from the api and create it when it doesn\'t exist' do
    FieldValue.create_or_update_from_remote(7_676_067)
    FieldValue.find(7_676_067).must_equal(field_value)
  end

  it 'must fetch an field_value from the api and update it when it exists' do
    existing_field_value.save!

    FieldValue.create_or_update_from_remote(7_676_067)
    FieldValue.find(7_676_067).must_equal(field_value)
  end
end

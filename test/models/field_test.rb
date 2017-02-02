require 'test_helper'

describe Field do
  let(:field) do
    Field.new(
      id: 2_846_632,
      phase_id: 1_065_145,
      label: 'What\'s the bug?',
      default_value: nil,
      type_id: 1,
      index: 0,
      created_at: '2017-01-18T12:03:21.735-02:00',
      updated_at: '2017-01-18T12:03:21.735-02:00'
    )
  end

  let(:existing_field) do
    field.assign_attributes(label: 'Test of change')
    field
  end

  let(:field_response) do
    {
      id: 2_846_632,
      phase_id: 1_065_145,
      label: 'What\'s the bug?',
      default_value: nil,
      type_id: 1,
      index: 0,
      options: [],
      created_at: '2017-01-18T12:03:21.735-02:00',
      updated_at: '2017-01-18T12:03:21.735-02:00'
    }.to_json
  end

  before do
    stub_request(:get, 'http://app.pipefy.com/fields/2846632.json')
      .to_return(body: field_response)

    create(:phase, id: 1_065_145)
    create(:type, id: 1)
  end

  it 'must fetch an field from the api and create it when it doesn\'t exist' do
    Field.create_or_update_from_remote(2_846_632)
    Field.find(2_846_632).must_equal(field)
  end

  it 'must fetch an field from the api and update it when it exists' do
    existing_field.save!

    Field.create_or_update_from_remote(2_846_632)
    Field.find(2_846_632).must_equal(field)
  end
end

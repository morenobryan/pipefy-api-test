require 'test_helper'

describe Phase do
  let(:phase) do
    Phase.new(
      id: 1_065_145,
      name: 'Start form',
      pipe_id: 143_156,
      index: 0,
      created_at: '2017-01-18T12:03:21.714-02:00',
      updated_at: '2017-01-18T12:03:21.714-02:00',
      can_edit: false
    )
  end

  let(:existing_phase) do
    phase.assign_attributes(name: 'Test of change')
    phase
  end

  let(:phase_response) do
    {
      id: 1_065_145,
      name: 'Start form',
      pipe_id: 143_156,
      index: 0,
      created_at: '2017-01-18T12:03:21.714-02:00',
      updated_at: '2017-01-18T12:03:21.714-02:00',
      can_edit: false,
      connected_pipes: [],
      jump_targets: []
    }.to_json
  end

  before do
    stub_request(:get, 'http://app.pipefy.com/phases/1065145.json')
      .to_return(body: phase_response)

    create(:pipe, id: 143_156)
  end

  it 'must fetch a phase from the api and create it when it doesn\'t exist' do
    Phase.create_or_update_from_remote(1_065_145)
    Phase.find(1_065_145).must_equal(phase)
  end

  it 'must fetch a phase from the api and update it when it exists' do
    existing_phase.save!

    Phase.create_or_update_from_remote(1_065_145)
    Phase.find(1_065_145).must_equal(phase)
  end
end

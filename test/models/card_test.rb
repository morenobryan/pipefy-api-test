require 'test_helper'

describe Card do
  let(:card) do
    Card.new(
      id: 1_605_641,
      title: 'Esse foi o João que postou!',
      due_date: nil,
      duration: 1_157_318.28969379,
      started_at: '2017-01-19T09:23:08.509-02:00',
      finished_at: nil,
      expiration_time: nil,
      index: nil,
      token: '436398379baa2499435ac6684309eac5431d06e2',
      expired: false,
      late: false,
      draft: true,
      done: false,
      can_show_pipe: true,
      current_phase_id: 1_065_145
    )
  end

  let(:existing_card) do
    card.assign_attributes(
      title: 'Teste de alteração',
      due_date: '2017-01-20T09:23:08.509-02:00'
    )
    card
  end

  let(:card_response) do
    {
      id: 1_605_641,
      title: 'Esse foi o João que postou!',
      current_phase_id: 1_065_145,
      due_date: nil,
      duration: 1_157_318.28969379,
      started_at: '2017-01-19T09:23:08.509-02:00',
      finished_at: nil,
      expiration_time: nil,
      index: nil,
      token: '436398379baa2499435ac6684309eac5431d06e2',
      pipe: {
        id: 143_156,
        name: 'Bug Tracking'
      },
      expired: false,
      late: false,
      draft: true,
      done: false,
      can_show_pipe: true,
      can_move_to_previous: true,
      next_phase: {
        id: 1_065_146,
        name: 'Screening'
      },
      assignees: [],
      labels: []
    }.to_json
  end

  before do
    stub_request(:get, 'http://app.pipefy.com/cards/1605641.json')
      .to_return(body: card_response)
    create(:phase, id: 1_065_145)
  end

  it 'must fetch a card from the api and create it when it doesn\'t exist' do
    Card.create_or_update_from_remote(1_605_641)
    Card.find(1_605_641).must_equal(card)
  end

  it 'must fetch a card from the api and update it when it exists' do
    existing_card.save!

    Card.create_or_update_from_remote(1_605_641)
    Card.find(1_605_641).must_equal(card)
  end
end

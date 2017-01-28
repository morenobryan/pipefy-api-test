require "test_helper"

describe CardsController do
  let(:card) { cards :one }

  it "gets index" do
    get cards_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_card_url
    value(response).must_be :success?
  end

  it "creates card" do
    expect {
      post cards_url, params: { card: { can_show_pipe: card.can_show_pipe, current_phase_id_id: card.current_phase_id_id, done: card.done, draft: card.draft, due_date: card.due_date, duration: card.duration, expiration_time: card.expiration_time, expired: card.expired, finished_at: card.finished_at, index: card.index, late: card.late, next_phase_id_id: card.next_phase_id_id, previous_phase_id_id: card.previous_phase_id_id, started_at: card.started_at, title: card.title, token: card.token } }
    }.must_change "Card.count"

    must_redirect_to card_path(Card.last)
  end

  it "shows card" do
    get card_url(card)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_card_url(card)
    value(response).must_be :success?
  end

  it "updates card" do
    patch card_url(card), params: { card: { can_show_pipe: card.can_show_pipe, current_phase_id_id: card.current_phase_id_id, done: card.done, draft: card.draft, due_date: card.due_date, duration: card.duration, expiration_time: card.expiration_time, expired: card.expired, finished_at: card.finished_at, index: card.index, late: card.late, next_phase_id_id: card.next_phase_id_id, previous_phase_id_id: card.previous_phase_id_id, started_at: card.started_at, title: card.title, token: card.token } }
    must_redirect_to card_path(card)
  end

  it "destroys card" do
    expect {
      delete card_url(card)
    }.must_change "Card.count", -1

    must_redirect_to cards_path
  end
end

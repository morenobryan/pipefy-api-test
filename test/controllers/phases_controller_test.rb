require "test_helper"

describe PhasesController do
  let(:phase) { phases :one }

  it "gets index" do
    get phases_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_phase_url
    value(response).must_be :success?
  end

  it "creates phase" do
    expect {
      post phases_url, params: { phase: { can_edit: phase.can_edit, index: phase.index, name: phase.name, pipe_id: phase.pipe_id } }
    }.must_change "Phase.count"

    must_redirect_to phase_path(Phase.last)
  end

  it "shows phase" do
    get phase_url(phase)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_phase_url(phase)
    value(response).must_be :success?
  end

  it "updates phase" do
    patch phase_url(phase), params: { phase: { can_edit: phase.can_edit, index: phase.index, name: phase.name, pipe_id: phase.pipe_id } }
    must_redirect_to phase_path(phase)
  end

  it "destroys phase" do
    expect {
      delete phase_url(phase)
    }.must_change "Phase.count", -1

    must_redirect_to phases_path
  end
end

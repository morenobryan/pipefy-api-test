require "test_helper"

describe PipesController do
  let(:pipe) { pipes :one }

  it "gets index" do
    get pipes_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_pipe_url
    value(response).must_be :success?
  end

  it "creates pipe" do
    expect {
      post pipes_url, params: { pipe: { can_edit: pipe.can_edit, name: pipe.name, organization_id: pipe.organization_id, token: pipe.token } }
    }.must_change "Pipe.count"

    must_redirect_to pipe_path(Pipe.last)
  end

  it "shows pipe" do
    get pipe_url(pipe)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_pipe_url(pipe)
    value(response).must_be :success?
  end

  it "updates pipe" do
    patch pipe_url(pipe), params: { pipe: { can_edit: pipe.can_edit, name: pipe.name, organization_id: pipe.organization_id, token: pipe.token } }
    must_redirect_to pipe_path(pipe)
  end

  it "destroys pipe" do
    expect {
      delete pipe_url(pipe)
    }.must_change "Pipe.count", -1

    must_redirect_to pipes_path
  end
end

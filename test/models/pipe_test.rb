require 'test_helper'

describe Pipe do
  let(:pipe) do
    Pipe.new(
      id: 143_185,
      name: 'New Developers Recruitment ',
      created_at: '2017-01-18T12:52:40.060-02:00',
      updated_at: '2017-01-18T13:04:17.283-02:00',
      token: '06b4cb5a1ae288e2de8e99c30600d93abcee3f18',
      can_edit: false,
      organization_id: Organization::ORGANIZATION_ID
    )
  end

  let(:existing_pipe) do
    pipe.assign_attributes(name: 'Test of change')
    pipe
  end

  let(:pipe_response) do
    {
      id: 143_185,
      name: 'New Developers Recruitment ',
      created_at: '2017-01-18T12:52:40.060-02:00',
      updated_at: '2017-01-18T13:04:17.283-02:00',
      token: '06b4cb5a1ae288e2de8e99c30600d93abcee3f18',
      can_edit: false
    }.to_json
  end

  before do
    stub_request(:get, 'http://app.pipefy.com/pipes/143185.json')
      .to_return(body: pipe_response)

    create(:organization, id: Organization::ORGANIZATION_ID)
  end

  it 'must fetch a pipe from the api and create it when it doesn\'t exist' do
    Pipe.create_or_update_from_remote(143_185)
    Pipe.find(143_185).must_equal(pipe)
  end

  it 'must fetch a pipe from the api and update it when it exists' do
    existing_pipe.save!

    Pipe.create_or_update_from_remote(143_185)
    Pipe.find(143_185).must_equal(pipe)
  end
end

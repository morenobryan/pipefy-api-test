require 'test_helper'

describe Organization do
  let(:organization) do
    Organization.new(
      id: 49_232,
      name: 'Pipefy Recruiting Exercises Source',
      created_at: '2017-01-18T12:03:08.274-02:00',
      updated_at: '2017-01-18T12:04:15.321-02:00'
    )
  end

  let(:existing_organization) do
    organization.assign_attributes(name: 'Pipefy Changed Organization')
    organization
  end

  let(:organization_response) do
    {
      id: 49_232,
      name: 'Pipefy Recruiting Exercises Source',
      created_at: '2017-01-18T12:03:08.274-02:00',
      updated_at: '2017-01-18T12:04:15.321-02:00',
      pipes: [
        {
          id: 143_156,
          name: 'Bug Tracking'
        },
        {
          id: 143_185,
          name: 'New Developers Recruitment '
        }
      ]
    }.to_json
  end

  before do
    stub_request(:get, 'http://app.pipefy.com/organizations/49232.json')
      .to_return(body: organization_response)
  end

  it 'must fetch an organization from the api and create it when it doesn\'t exist' do
    Organization.create_or_update_from_remote(Organization::ORGANIZATION_ID)
    Organization.find(Organization::ORGANIZATION_ID).must_equal(organization)
  end

  it 'must fetch an organization from the api and update it when it exists' do
    existing_organization.save!

    Organization.create_or_update_from_remote(Organization::ORGANIZATION_ID)
    Organization.find(Organization::ORGANIZATION_ID).must_equal(organization)
  end
end

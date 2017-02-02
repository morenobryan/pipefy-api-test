require 'test_helper'

describe HomeController do
  before do
    create(:organization, id: Organization::ORGANIZATION_ID)
  end

  it 'should get index' do
    get root_url
    value(response).must_be :success?
  end

end

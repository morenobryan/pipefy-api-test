require "test_helper"

describe TypesController do
  let(:type) { types :one }

  it "gets index" do
    get types_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_type_url
    value(response).must_be :success?
  end

  it "creates type" do
    expect {
      post types_url, params: { type: { component: type.component, html_class: type.html_class, name: type.name } }
    }.must_change "Type.count"

    must_redirect_to type_path(Type.last)
  end

  it "shows type" do
    get type_url(type)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_type_url(type)
    value(response).must_be :success?
  end

  it "updates type" do
    patch type_url(type), params: { type: { component: type.component, html_class: type.html_class, name: type.name } }
    must_redirect_to type_path(type)
  end

  it "destroys type" do
    expect {
      delete type_url(type)
    }.must_change "Type.count", -1

    must_redirect_to types_path
  end
end

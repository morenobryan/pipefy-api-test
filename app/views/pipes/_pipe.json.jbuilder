json.extract! pipe, :id, :name, :token, :can_edit, :organization_id, :created_at, :updated_at
json.url pipe_url(pipe, format: :json)
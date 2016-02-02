json.array!(@pseudos) do |pseudo|
  json.extract! pseudo, :id, :fake_name, :real_name, :votes
  json.url pseudo_url(pseudo, format: :json)
end

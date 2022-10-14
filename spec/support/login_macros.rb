module LoginMarcos
  def login(params)
    post api_v1_sessions_path, headers: { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json' }, params: params, xhr: true
  end
end

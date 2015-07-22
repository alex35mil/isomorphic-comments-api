task :production do

  set :domain,          'do_sbjs'
  set :public_domain,   'api.isomorphic-comments.alexfedoseev.com'
  set :app_server_name, "#{app}"
  set :app_sys_id,      "#{app}-#{app_part}"

end

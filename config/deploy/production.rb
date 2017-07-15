server '52.199.1.245', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/shohei/.ssh/id_rsa'
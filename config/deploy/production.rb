set :application, 'kldxteam_production'
set :stage, :production
set :rails_env, :production
set :deploy_to, '/home/deploy/kldxteam_production'
set :release_note_url, 'http://kldxteam.com/release_note.txt'

server '128.199.103.111', user: 'deploy', roles: %w{web app db job}

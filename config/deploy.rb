set :application, "rainbow"
set :repository,  "https://github.com/schroerbrian/Rainbow"

set :scm, :git 

role :web, "ec2-54-226-238-173.compute-1.amazonaws.com"                          # Your HTTP server, Apache/etc
role :db,  "ec2-54-226-238-173.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run

ssh_options[:forward_agent] = true
set :ssh_options, {:forward_agent => true}
default_run_options[:pty] = true  # Must be set for the password prompt from git to work
#efault_run_options[:shell] = 'bash'
ssh_options[:keys] = ["~/Downloads/rainbow.pem"]
ssh_options[:keys_only] = true
set :keep_releases, 8

set :user, "ubuntu"
set :use_sudo, true

#set :rvm_type, :user

set :deploy_to, "/var/rails/#{application}"

after "deploy:restart", "deploy:restart_workers"

after 'deploy:update_code' do
  run "cd #{release_path}; bundle install --binstubs"
end
 
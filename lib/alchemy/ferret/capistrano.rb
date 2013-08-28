# This recipe contains Capistrano recipes for handling ferret while deploying your application.
#
# It also contains a ferret:rebuild_index task to rebuild the index after deploying your application.
#
::Capistrano::Configuration.instance(:must_exist).load do
  after "deploy:setup",           "alchemy:ferret:create_shared_folder"
  after "deploy:finalize_update", "alchemy:ferret:create_symlink"

  namespace :alchemy do
    namespace :ferret do
      # This task creates the shared folder for ferret index while setting up your server.
      desc "Creates ferret index directory in the shared folder. Called after deploy:setup"
      task :create_shared_folder, :roles => :app do
        run "mkdir -p #{shared_path}/index"
      end

      # This task creates the symlink for ferret index folder.
      desc "Creates the symlink for ferret index folder. Called after deploy:finalize_update"
      task :create_symlink, :roles => :app do
        run "rm -rf #{release_path}/index"
        run "ln -nfs #{shared_path}/index #{release_path}/"
      end
    end
  end

  namespace :ferret do
    # This task rebuilds the ferret index for the EssenceText and EssenceRichtext Models.
    # Call it before deploy:restart like +before "deploy:restart", "alchemy:rebuild_index"+ in your +deploy.rb+.
    # It uses the +alchemy:rebuild_index+ rake task found in +vendor/plugins/alchemy/lib/tasks+.
    desc "Rebuild the ferret index. Call before deploy:restart"
    task :rebuild_index, :roles => :app do
      run "cd #{current_path} && #{rake} RAILS_ENV=#{fetch(:rails_env, 'production')} ferret:rebuild_index"
    end
  end
end

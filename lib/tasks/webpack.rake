require 'pp'

desc 'compile bundles using webpack'
task "assets:webpack_mine" do
  cmd    = 'cd client && webpack --config webpack.config.js --progress --profile --colors --json'
  output = `#{cmd}`
  stats  = JSON.parse output

  pp stats['assetsByChunkName']
end


Rake::Task['assets:precompile']
  .clear_prerequisites
  .enhance(['assets:compile_environment'])

namespace :assets do

  #In this task, set prerequisites for the assets:precompile task
  task :compile_environment => :webpack do
    Rake::Task['assets:environment'].invoke
  end

  desc 'Compile assets with webpack'
  task :webpack do
    cmd    = 'cd client && webpack --config webpack.config.js --progress --profile --colors --json'
    output = `#{cmd}`
    stats  = JSON.parse output

    pp stats['assetsByChunkName']
  end

  task :clobber do
    path = "#{Rails.root}/app/assets/javascripts/bundle.js"
    rm_rf path
  end

  namespace :webpack do
    desc 'compile with webpack and watch for changes'
    task :watch do
      sh "cd client && webpack --config webpack.config.js --colors --progress --watch --devtool inline-source-map"
    end
  end

end

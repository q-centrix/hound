Hound (Q-Centrix bootleg)

Visit https://q-centrix-hound.herokuapp.com/repos to add new repos to the scan list.
You will have to click a button to show private repos.

**Q-Centrix Dev setup instructions**

1. Run `bin/setup`
2. Update .env with the following
   - Set HOUND_GITHUB_TOKEN to qcx-ci token
   - Set HOUND_GITHUB_USERNAME to qcx-ci
3. Create a ngrok account and follow their instructions for local setup
4. `ngrok http 5000`
5. Setup a development application in Github
   - Set both URLs to the tunnel URL found on your ngrok [dashboard](https://dashboard.ngrok.com/).
     - Alternately, localhost:5000 may work as well.
   - Copy Client ID/Client Secret and add to .env
   - Update Github webook to point at the dashboard URL.
6. Run `foreman start`
   - Requires redis to be installed

**Files changed from thoughtbot/master as of 12/30/2015**
- .foreman
  - Legacy code, unsure if needed.
- Gemfile
  - Use Unicorn instead of Puma
- Procfile
  - Legacy configuration
- Readme.MD
  - Q-Centrix bootleg notes.
- app/assets/javascripts/directives/repo.js.coffee.erb
  - Automatically activate all repos
- app/assets/javascripts/directives/repo_list.js.coffee.erb
  - Don't load payment info
- app/models/hound_config.rb
  - Comment out jslint
- app/models/plan.rb
  - Set cost of private repos to 0.
- app/services/repo_subscriber
  - Return true instead of creating a subscription.
- app/services/repo_synchronization.rb
  - Pass private: false always.
- config/initializers/redis.rb
  - Legacy code, unsure if needed.
- config/style_guides/ruby.yml
  - Q-Centrix Ruby guidelines.
- config/unicorn.rb
  - Legacy configuration

See [thoughtbot's](https://github.com/thoughtbot/hound/blob/master/README.md) README for more info.

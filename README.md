Hound (Q-Centrix bootleg)

Visit https://q-centrix-hound.herokuapp.com/repos to add new repos to the scan list.

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

See [thoughtbot's](https://github.com/thoughtbot/hound/blob/master/README.md) README for more info.

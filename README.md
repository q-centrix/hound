Hound (Q-Centrix bootleg)
=====

**Hound is wonderful open source code built by Thoughtbot with a permissive MIT
license of their copyright. At Q-Centrix, we deploy this version of hound to
heroku to check our code (a simple ``git push heroku master``
after defining your environment variables should work)**

Visit https://q-centrix-hound.herokuapp.com/repos to add new repos to the scan list.

**Q-Centrix Dev setup instructions**

1. Run `bin/setup`
2. Update .env with the following
   - Remove DATABASE_URL
   - Set ENABLE_HTTPS to no
   - Set HOUND_GITHUB_TOKEN to qcx-ci token
   - Set HOUND_GITHUB_USERNAME to qcx-ci
   - Set RACK_ENV and RAILS_ENV to development
   - Set SECRET_KEY_BASE to whatever
3. Create a ngrok account and follow their instructions for local setup
4. `ngrok http 5000`
5. Setup a development application in Github
   - Set both URLs to the tunnel URL found on your ngrok [dashboard](https://dashboard.ngrok.com/).
   - Copy Client ID/Client Secret and add to .env
   - Update Github webook to point at the dashboard URL.
6. Run `foreman start`
   - Requires redis to be installed


**What follows is from Thoughtbot's documentation, this project may not be up to
date with the real version**

Take care of pesky code reviews with a trusty [Hound](http://houndci.com).

Hound reviews GitHub pull requests for style guide violations. [View the style
guide &rarr;](https://github.com/thoughtbot/guides/tree/master/style)

This will deploy to heroku on every commit to master.

## Configure the Hound Service

We run Hound as a hosted service at [houndci.com].

If you are setting up Hound for the first time, see the [configuration] page.

If you have questions about the service, see our [FAQ] or email [hound@thoughtbot.com].

[houndci.com]: https://houndci.com
[configuration]: https://houndci.com/configuration
[FAQ]: https://houndci.com/faq
[hound@thoughtbot.com]: mailto:hound@thoughtbot.com

## Configure Hound on Your Local Development Environment

1. After cloning the repository, run the setup script `./bin/setup`
2. Log into your GitHub account and go to the
   [Application Settings under Account settings](https://github.com/settings/applications).
3. Under the GitHub Developer Applications panel - Click on "Register new
   application"
4. Point [ngrok] to your local Hound instance:
   `ngrok -subdomain=<your-initials>-hound 5000`
5. Fill in the application details:
  * Application Name: Hound Development
  * Homepage URL: http://<your-initials>-hound.ngrok.com
  * Authorization Callback URL: http://<your-initials>-hound.ngrok.com
6. On the confirmation screen, copy the `Client ID` and `Client Secret` to
   `.env`. Note the setup script copies `.sample.env` to `.env` for you, if the
   file does not exist.
7. Run `foreman start`. Foreman will start the web server, `redis-server`, and
   the resque background job queue. NOTE: `rails server` will not load the
   appropriate environment variables and you'll get a "Missing `secret_key_base`
   for 'development' environment" error.

[ngrok]: https://ngrok.com

Testing
-----------

1. Set up your `development` environment as per above.
2. Run `rake` to execute the full test suite.

#### Stripe

To test Stripe payments on staging use this fake credit card number.

<table>
  <thead>
    <tr>
      <th>Card</th>
      <th>Number</th>
      <th>Expiration</th>
      <th>CVV</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Visa</td>
      <td>4242424242424242</td>
      <td>Any future date</td>
      <td>Any 3 digits</td>
    </tr>
  </tbody>
</table>

Contributing
------------

First, thank you for contributing!

Here a few guidelines to follow:

1. Write tests
2. Make sure the entire test suite passes locally and on Travis CI
3. Open a pull request on GitHub
4. [Squash your commits](https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature) after receiving feedback

There a couple areas we would like to concentrate on.

1. Add support for JavaScript
2. Add support for CSS and Sass
3. Write [style guides](app/models/style_guide) that don't currently exist and
   would enforce the
   [thoughtbot style guide](https://github.com/thoughtbot/guides).

# Quickstart

Install the mvp gem:

```
gem install mvpkit
```

Set up a new project

```
mvp new PROJECT
```

Start the server (make sure you have [foreman](https://github.com/ddollar/foreman) installed)

```
cd PROJECT
foreman start
```

# Introduction

mvpkit is a tool for quickly building prototypes and rapid ideation.  This stack is built entirely for speed of development.

If you are looking for a landing page tool, [there](http://leadpages.net) [are](https://wix.com) [plenty](https://instapage.com) [of](https://unbounce.com) [them](https://hubspot.com) [out](https://landingfolio.com) [there](https://landerapp.com).

It combines two fast (and not necessarily long term) web technologies to test your ideas and (in)validate them quickly.

# Heroku

To setup deployment for heroku, first create the project:

```
heroku create PROJECT
```

Then setup the stack:

```
heroku addons:create heroku-postgresql
heroku buildpacks:set heroku/ruby
heroku buildpacks:add --index 1 heroku/nodejs
```

And deploy:

```
git push heroku master
```

# Extras

## Google Sitemaps

If SEO matters to you, you'll want to turn on google sitemap generation.

#### Setup

Edit `config/sitemap.rb` with your own custom routes.

#### Updating

Run `rake sitemap:refresh` in production to update Bing/Google with changes to the sitemap.

#### Scheduling

Put this in a `cron` task or in Heroku Scheduler.

```
rake sitemap:worker
```

If you're on heroku:

```
heroku addons:create scheduler:standard
heroku addons:open scheduler
```

And add the following task: `rake sitemap:worker`.  Your choice on the frequency but I usually use `daily`

## SEO

### Meta Properties

All meta fields are controlled via the `page` object.  Set attributes on this in order to get meta properties populated.  This is best done at the controller level.

### Available Properties

|Property|Description|Inheritance|
|---|---|---|
|`page.title`|   |   |
|`page.description`|   |   |
|`page.author`|   |   |
|`page.og_url`|   |   |
|`page.og_type`|   |   |
|`page.og_title`|   |`page.title`|
|`page.og_description`|   |`page.description`|
|`page.og_image`|   |   |
|`page.twitter_card`|   |   |   |

# Helpers

## Geolocation

By default, Geolocation of the session will automatically happen.

You can access the session's geolocation in `request.location`.

To test geolocation locally, set `SPOOF_IP=true` in your `.env`.

For more info see [Geocoder](https://github.com/alexreisner/geocoder).

## Bootstrap

### `row_groups_of`

Makes a series of row/col `div` elements based in group count.

```
<% row_groups_of(3, [1,2,3,4,5,6,7,8,9]) do |i| %>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h2 class="text-center"><%= i %></h2>
    </div>
  </div>
<% end %>
```

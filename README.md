# Jekyll Airtable Data

Jekyll plugin to pull down your Airtable tables as datafiles (JSON) through Jekyll Commands.

## Installation

Add plugin to your Gemfile:

```ruby
gem 'jekyll-airtable_data'
```

Add Airtable settings to your _config.yml file:

```yml
airtable_data:
  api_key: [Your Airtable API Key] # Airtable API key available in the API documentation for your base
  app_id: [Your Airtable App ID] # Airtable app ID found in the API documentation for your base
  tables:
    - [Your Airtable Table Name 1]
    - [Your Airtable Table Name 2]
    - [Your Airtable Table Name 3]
```

## Run Airtable Data

Execute via Jekyll Command as needed:

    $ bundle exec jekyll airtable_data

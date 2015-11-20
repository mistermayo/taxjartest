# Weather Report!

A tiny app to see what the weather is like for your remote coworkers.

## Getting Started

Use Bundler to get your dependencies:

```
bundle install
```

Set up a root `.env` configuration file with your API tokens:

```
FORECAST_API_TOKEN=[YOUR TOKEN]
```

Run the server:

```
bundle exec puma -C config/puma.rb
```
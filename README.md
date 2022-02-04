# Crypto Fetcher

The aim of this is to fetch crypto currency info from https://api.nomics.com/v1/

The api key for this endpoint is not in the repo

# Prerequisites
* Install ruby 2.7.3
* Install bundler
* Run make build
* Run export API_URL=https://api.nomics.com/v1/currencies/ticker
* Run export API_KEY=your_key_here

# Run the app
./bin/run.rb

# More info
I managed to add the ability to filter by ticker, you can see I started moving onto filtering the returned attributes however due to time constraints that test is still failing.

My specs show more of my thought process around this.

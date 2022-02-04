require 'uri'
require 'net/http'
require 'json'

class CryptoFetcher

  # Move to a .env file
  API_KEY = ENV['API_KEY']
  API_ENDPOINT = ENV["API_URL"]
  DEFAULT_IDS = ['BTC','ETH','XRP']

  def initialize(tickers: nil, params: nil)
    @formatted_tickers = format_tickers(tickers || DEFAULT_IDS)
    @params = params
  end

  def fetch
    endpoint = URI("#{API_ENDPOINT}?key=#{API_KEY}&ids=#{formatted_tickers}")
    JSON.parse(Net::HTTP.get(endpoint))
  end

  private

  attr_reader :formatted_tickers, :params

  def format_tickers(ids)
    "[#{ids.join(',')}]"
  end
end


# curl "https://api.nomics.com/v1/currencies/ticker?key=your-key-here&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1"

require 'spec_helper'
require 'crypto_fetcher'
require 'uri'

RSpec.describe CryptoFetcher do


  context "without any params or tickers" do
    let(:expected_result) { [{"id": "BTC"}, {"id": "ETH"}, {"id": "XRP"}].to_json }

    it 'fetches the crypto currencies' do
      expect(Net::HTTP).to receive(:get).and_return(expected_result)

      result = CryptoFetcher.new.fetch

      expect(result[0]["id"]).to eq('BTC')
      expect(result[1]["id"]).to eq('ETH')
      expect(result[2]["id"]).to eq('XRP')
    end
  end

  context 'with tickers specified' do

    let(:expected_result) { [{"id": "BTC"}, {"id": "ETH"}].to_json }
    let(:expected_endpoint) { URI('https://api.nomics.com/v1/currencies/ticker?key=f9e3af809fe67df307029ac6e24c52815b144ac4&ids=[ETH,BTC]')}

    it 'fetches the crypto data for specific params' do
      expect(Net::HTTP).to receive(:get).with(expected_endpoint).and_return(expected_result)

      tickers = ['ETH', 'BTC']

      result = CryptoFetcher.new(tickers: tickers).fetch

      expect(result.length).to eq(2)
    end
  end

  context 'with params specified' do
    context 'with tickers specified' do

    let(:expected_result) do
      [
        {
          "id": "BTC",
          "name": "test name",
          "symbol": "test symbol"
        }
      ].to_json
    end

    let(:expected_endpoint) { URI('https://api.nomics.com/v1/currencies/ticker?key=f9e3af809fe67df307029ac6e24c52815b144ac4&ids=[ETH,BTC]')}

    it 'fetches the crypto data for specific params' do
      expect(Net::HTTP).to receive(:get).with(expected_endpoint).and_return(expected_result)

      params = ['name', 'symbol']

      result = CryptoFetcher.new(params: params).fetch

      expect(result.length).to eq(2)
    end
  end
  end
end

#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/crypto_fetcher'
require 'pry-nav'
require 'json'

puts CryptoFetcher.new.fetch

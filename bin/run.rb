#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/crypto_fetcher'
require 'pry-nav'
require 'json'
require 'dotenv'

Dotenv.load('../.env')

# CryptoFetcher.new.fetch(*ARGV)
puts CryptoFetcher.new.fetch

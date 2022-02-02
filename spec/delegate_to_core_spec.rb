# frozen_string_literal: true

require 'spec_helper'

describe BetterUri::URI do
  subject { URI('https://depay.fi') }

  it 'delegates to_s to URI core' do
    expect(subject.to_s).to eq 'https://depay.fi'
  end

  it 'delegates scheme to URI core' do
    expect(subject.scheme).to eq 'https'
  end

  it 'delegates scheme= to URI core' do
    subject.scheme = 'http'
    expect(subject.to_s).to eq 'http://depay.fi'
  end

  it 'delegates host to URI core' do
    expect(subject.host).to eq 'depay.fi'
  end

  it 'delegates host= to URI core' do
    subject.host = 'google.com'
    expect(subject.to_s).to eq 'https://google.com'
  end

  it 'delegates hostname to URI core' do
    expect(subject.hostname).to eq 'depay.fi'
  end

  it 'delegates hostname= to URI core' do
    subject.hostname = 'google.com'
    expect(subject.to_s).to eq 'https://google.com'
  end

  it 'delegates path to URI core' do
    expect(subject.path).to eq ''
  end

  it 'delegates path= to URI core' do
    subject.path = '/endpoint'
    expect(subject.to_s).to eq 'https://depay.fi/endpoint'
  end

  it 'delegates port to URI core' do
    expect(subject.port).to eq 443
  end

  it 'delegates port= to URI core' do
    subject.port = 3000
    expect(subject.to_s).to eq 'https://depay.fi:3000'
  end

  it 'delegates request_uri to URI core' do
    expect(URI('http://depay.fi/abc?test=123').request_uri).to eq '/abc?test=123'
  end
end

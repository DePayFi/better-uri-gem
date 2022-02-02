require 'spec_helper'

describe BetterUri::URI do
  it 'initalizes' do
    URI('https://depay.fi')
  end

  it 'initalizes also when given a URI ruby core object' do
    expect(URI(BetterUri::URI_CORE.parse('https://depay.fi')).to_s).to eq('https://depay.fi')
  end
end

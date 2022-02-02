# frozen_string_literal: true

require 'spec_helper'

describe BetterUri::URI do
  it 'initalizes' do
    expect(URI('https://depay.fi').to_s).to eq 'https://depay.fi'
  end
end

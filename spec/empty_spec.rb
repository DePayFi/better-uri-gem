# frozen_string_literal: true

require 'spec_helper'

describe BetterUri::URI do
  it 'responds to empty?' do
    expect(URI('https://depay.fi').empty?).to eq false
  end
end

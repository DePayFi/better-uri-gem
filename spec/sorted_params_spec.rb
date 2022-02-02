# frozen_string_literal: true

require 'spec_helper'

describe BetterUri::URI do
  subject { URI('https://depay.fi') }

  it 'makes sure that query params are alphabetically sorted' do
    subject.query.merge!(z: 4)
    subject.query.merge!(a: 1)
    subject.query.merge!(x: 3)
    subject.query.merge!(b: 2)
    expect(subject.to_s).to eq 'https://depay.fi?a=1&b=2&x=3&z=4'
  end
end

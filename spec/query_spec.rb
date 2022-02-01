require 'spec_helper.rb'

describe BetterUri::URI do
  subject { URI('https://depay.fi') }

  it 'returns query' do
    expect(subject.query).to be_kind_of BetterUri::Query
  end
end

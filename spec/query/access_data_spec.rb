require 'spec_helper.rb'

describe BetterUri::URI do
  subject { URI('https://depay.fi') }

  context 'access query data' do
    subject { URI('https://depay.fi?id=1&place[name]=casa') }

    it 'allows to access query data with hash-bracket-notiation' do
      expect(subject.query[:id]).to eq '1'
    end

    it 'allows to access query data with dig' do
      expect(subject.query.dig(:place, :name)).to eq 'casa'
    end
  end
end

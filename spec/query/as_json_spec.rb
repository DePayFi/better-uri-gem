# frozen_string_literal: true

require 'spec_helper'

describe BetterUri::URI do
  subject { URI('https://depay.fi') }

  context 'except' do
    subject { URI('https://depay.fi?one=1&two=2&three=3') }

    it 'returns query as param' do
      expect(subject.query.as_json).to eq({ 'one' => '1', 'three' => '3', 'two' => '2' })
    end
  end
end

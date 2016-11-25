require 'spec_helper'

require 'readonly/hash'

describe ReadOnly do
  it 'has a version number' do
    expect(ReadOnly::VERSION).not_to be nil
  end

  let(:writable_hash) {
    { user: { name: 'Konstantin', phone: '555-222-5555' } }
  }

  let(:readonly_hash) { ReadOnly::Hash.new(writable_hash) }

  context 'when instantiating' do
    it 'can set the delegate' do
      expect(readonly_hash.instance_variable_get(:@delegate)).to eq(writable_hash)
    end
  end

  context 'when reading' do
    it 'returns the readonly copies of data' do
      expect(readonly_hash[:user][:name]).to eq('Konstantin')
    end
    it 'returns complete hashes that are #eql?() but not identical' do
      expect(readonly_hash[:user]).to eq writable_hash[:user]
      expect(readonly_hash[:user].object_id).not_to equal(writable_hash[:user].object_id)
    end
  end

  context 'when modifying the top level key' do
    it 'raises NoMethodError' do
      expect{readonly_hash[:user] = 978021398498}.to raise_error(NoMethodError)
    end
  end

  context 'when modifying second level key' do
    before { readonly_hash[:user][:phone] = 'Not Available' }
    it 'modifies a copy, not the original' do
      expect(readonly_hash[:user][:phone]).to eq '555-222-5555'
    end
  end


end

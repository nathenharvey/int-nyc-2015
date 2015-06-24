require 'spec_helper'

describe 'hello::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'is awesome' do
    expect(true).to eq true
  end

  it 'is listening on port 80' do
    expect(port 80).to be_listening
  end

  it 'gets a 200 response code'

  it 'has the expected content on the page'
end

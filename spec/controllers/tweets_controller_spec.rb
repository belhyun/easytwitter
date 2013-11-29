require 'spec_helper'

describe Api::V1::TweetsController do
  it 'rank' do
    get "rank"
    expect(response).to be_success
    expect(response.status).to eq(200)
  end
end

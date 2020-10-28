require 'app'

describe 'homepage' do
  it 'displays a successful status code' do
    visit("/")
    expect(page.status_code).to eq(200)
  end
end

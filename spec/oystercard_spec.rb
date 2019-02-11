require "oystercard"

describe Oystercard do

  it 'has a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'can be topped up' do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it 'will not accept more than £90' do
    expect{subject.top_up(91)}.to raise_error "Balance limit is £90"
  end

  it 'deducts the fare from the balance' do
    subject.top_up(10)
    subject.deduct(5)
    expect(subject.balance).to eq(5)
  end

end

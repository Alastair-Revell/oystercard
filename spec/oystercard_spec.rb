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

  it "can tell if it's on a journey" do
    expect(subject.in_journey?).to eq(false)
  end

  it 'can touch into a journey' do
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject.in_journey?).to eq(true)
  end

  it 'can touch out of a jourey' do
    subject.touch_out
    expect(subject.in_journey?).to eq(false)
  end

  it 'cannot be touched in if it has an insufficient balance' do
    expect{subject.touch_in(station)}.to raise_error "You have an insufficient balance for this journey"
  end

  it 'deducts the fare when touched out' do
    subject.top_up(5)
    expect {subject.touch_out}.to change{subject.balance}.by(-1)
  end

  let(:station){ double :station }

  it 'stores the entry station' do
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end

end

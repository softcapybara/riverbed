# frozen_string_literal: true

RSpec.describe "Flow" do
  it "runs", :aggregate_failures do
    expect(EmptyFlow.run).to eq(nil)
    expect(Flow1.run(2)).to eq(17)
  end

  it "accepts options" do
    expect(EmptyFlow.run(nil, logger: nil)).to eq(nil)
    expect(Flow1.run(2, logger: nil)).to eq(17)
    expect(Flow5.run(nil, logger: nil)).to eq(4)
    expect(Flow5.run(4, logger: nil)).to eq(6)
  end

  it "can skip steps", :aggregate_failures do
    expect(Flow1.run(3)).to eq(11)
    expect(Flow1.run(4)).to eq(25)
  end

  it "can break flow", :aggregate_failures do
    expect(Flow2.run(2)).to eq(8)
    expect(Flow2.run(3)).to eq(3)
  end

  context "with always steps" do
    it "executes always steps", :aggregate_failures do
      expect(Flow3.run(2)).to eq(8)
    end

    it "executes always steps even when raising error in normal steps", :aggregate_failures do
      expect(Flow4.run(10)).to eq(20)
    end
  end
end

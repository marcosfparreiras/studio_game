require_relative 'clumsy_player'

describe ClumsyPlayer do
  $stdout = StringIO.new

  before do
    @initial_health = 100
    @boost_factor = 4
    @player = ClumsyPlayer.new("klutz", @initial_health, @boost_factor)
  end

  it "only gets half the point value for each treasure" do
    # @player.points.should == 0
    expect(@player.points).to eq(0)

    hammer = Treasure.new(:hammer, 50)
    @player.found_treasure(hammer)
    @player.found_treasure(hammer)
    @player.found_treasure(hammer)

    # @player.points.should == 75
    expect(@player.points).to eq(75)

    crowbar = Treasure.new(:crowbar, 400)
    @player.found_treasure(crowbar)

    # @player.points.should == 275
    expect(@player.points).to eq(275)

    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end


    expect(yielded).to eq([Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)])
  end

  it "receives several w00ts when w00ted" do
    @player.w00t
    expect(@player.health).to eq(@initial_health + @boost_factor*15)
  end

end
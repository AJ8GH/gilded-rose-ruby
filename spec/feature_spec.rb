describe 'feature tests' do
  def print_output(days)
    items = [
      Item.new("+5 Dexterity Vest", 10, 20),
      Item.new("Aged Brie", 2, 0),
      Item.new("Elixir of the Mongoose", 5, 7),
      Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
      Item.new("Sulfuras, Hand of Ragnaros", -1, 80),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49),
      # This Cod item does not work properly yet
      Item.new("Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
    ]

    gilded_rose = GildedRose.new(items)
    (0...days).each do |day|
      puts "-------- day #{day} --------"
      puts "name, sellIn, quality"
      items.each do |item|
        puts item
      end
      puts ""
      gilded_rose.update_quality
    end
  end

  output0 = [
    '-------- day 0 --------',
    'name, sellIn, quality',
    '+5 Dexterity Vest, 10, 20',
    'Aged Brie, 2, 0',
    'Elixir of the Mongoose, 5, 7',
    'Sulfuras, Hand of Ragnaros, 0, 80',
    'Sulfuras, Hand of Ragnaros, -1, 80',
    'Backstage passes to a TAFKAL80ETC concert, 15, 20',
    'Backstage passes to a TAFKAL80ETC concert, 10, 49',
    'Backstage passes to a TAFKAL80ETC concert, 5, 49',
    'Conjured Mana Cake, 3, 6',
    "\n"
  ].join("\n")

  it 'prints correct output after 1 day' do
    expect { print_output(1) }.to output(output0).to_stdout
  end
end

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

output1 = [
  '-------- day 1 --------',
  'name, sellIn, quality',
  '+5 Dexterity Vest, 9, 19',
  'Aged Brie, 1, 1',
  'Elixir of the Mongoose, 4, 6',
  'Sulfuras, Hand of Ragnaros, 0, 80',
  'Sulfuras, Hand of Ragnaros, -1, 80',
  'Backstage passes to a TAFKAL80ETC concert, 14, 21',
  'Backstage passes to a TAFKAL80ETC concert, 9, 50',
  'Backstage passes to a TAFKAL80ETC concert, 4, 50',
  'Conjured Mana Cake, 2, 5',
  "\n"
].join("\n")

output2 = [
  '-------- day 2 --------',
  'name, sellIn, quality',
  '+5 Dexterity Vest, 8, 18',
  'Aged Brie, 0, 2',
  'Elixir of the Mongoose, 3, 5',
  'Sulfuras, Hand of Ragnaros, 0, 80',
  'Sulfuras, Hand of Ragnaros, -1, 80',
  'Backstage passes to a TAFKAL80ETC concert, 13, 22',
  'Backstage passes to a TAFKAL80ETC concert, 8, 50',
  'Backstage passes to a TAFKAL80ETC concert, 3, 50',
  'Conjured Mana Cake, 1, 4',
  "\n"
].join("\n")

output3 = [
  '-------- day 3 --------',
  'name, sellIn, quality',
  '+5 Dexterity Vest, 7, 17',
  'Aged Brie, -1, 4',
  'Elixir of the Mongoose, 2, 4',
  'Sulfuras, Hand of Ragnaros, 0, 80',
  'Sulfuras, Hand of Ragnaros, -1, 80',
  'Backstage passes to a TAFKAL80ETC concert, 12, 23',
  'Backstage passes to a TAFKAL80ETC concert, 7, 50',
  'Backstage passes to a TAFKAL80ETC concert, 2, 50',
  'Conjured Mana Cake, 0, 3',
  "\n"
].join("\n")

output4 = [
  '-------- day 4 --------',
  'name, sellIn, quality',
  '+5 Dexterity Vest, 6, 16',
  'Aged Brie, -2, 6',
  'Elixir of the Mongoose, 1, 3',
  'Sulfuras, Hand of Ragnaros, 0, 80',
  'Sulfuras, Hand of Ragnaros, -1, 80',
  'Backstage passes to a TAFKAL80ETC concert, 11, 24',
  'Backstage passes to a TAFKAL80ETC concert, 6, 50',
  'Backstage passes to a TAFKAL80ETC concert, 1, 50',
  'Conjured Mana Cake, -1, 1',
  "\n"
].join("\n")

describe 'feature tests' do
  it 'prints correct output after 1 day' do
    expect { print_output(1) }.to output(output0).to_stdout
  end

  it 'prints correct output after 2 days' do
    expect { print_output(2) }.to output(output0 + output1).to_stdout
  end

  it 'prints correct output after 5 days' do
    output = output0 + output1 + output2 + output3 + output4
    expect { print_output(5) }.to output(output).to_stdout
  end
end

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

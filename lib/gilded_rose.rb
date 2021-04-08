class GildedRose
  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  SELL_IN_REDUCTION = 1
  NORMAL_QUALITY_CHANGE = 1
  BACKSTAGE_DOUBLE_QUALITY = 10
  BACKSTAGE_TRIPLE_QUALITY = 5
  SELL_BY_DATE = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      unless item.name == 'Aged Brie' || item.name == 'Backstage passes to a TAFKAL80ETC concert'
        item.quality -= NORMAL_QUALITY_CHANGE if item.name != 'Sulfuras, Hand of Ragnaros' && item.quality > MINIMUM_QUALITY
      else
        item.quality += NORMAL_QUALITY_CHANGE if item.quality < MAXIMUM_QUALITY
      end

      if item.name == 'Backstage passes to a TAFKAL80ETC concert' && item.sell_in <= BACKSTAGE_DOUBLE_QUALITY
        item.quality += NORMAL_QUALITY_CHANGE if item.quality < MAXIMUM_QUALITY
        item.quality += NORMAL_QUALITY_CHANGE if item.sell_in <= BACKSTAGE_TRIPLE_QUALITY && item.quality < MAXIMUM_QUALITY
      end

      item.sell_in -= SELL_IN_REDUCTION if item.name != 'Sulfuras, Hand of Ragnaros'

      if item.sell_in < SELL_BY_DATE
        if item.name == 'Aged Brie'
          item.quality += NORMAL_QUALITY_CHANGE unless item.quality >= MAXIMUM_QUALITY
        elsif item.name != 'Backstage passes to a TAFKAL80ETC concert'
          item.quality -= NORMAL_QUALITY_CHANGE if item.quality > MINIMUM_QUALITY && item.name != 'Sulfuras, Hand of Ragnaros'
        else
          item.quality = MINIMUM_QUALITY
        end
      end
    end
  end
end

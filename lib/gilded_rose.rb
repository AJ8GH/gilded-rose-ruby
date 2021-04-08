class GildedRose
  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  NORMAL_QUALITY_CHANGE = 1
  BACKSTAGE_DOUBLE_QUALITY = 10
  BACKSTAGE_TRIPLE_QUALITY = 5
  SELL_BY_DATE = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert'
        if item.quality > MINIMUM_QUALITY
          item.quality -= NORMAL_QUALITY_CHANGE if item.name != 'Sulfuras, Hand of Ragnaros'
        end
      else
        item.quality += NORMAL_QUALITY_CHANGE if item.quality < MAXIMUM_QUALITY
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            if item.sell_in <= BACKSTAGE_DOUBLE_QUALITY
              item.quality += NORMAL_QUALITY_CHANGE if item.quality < MAXIMUM_QUALITY
            if item.sell_in <= BACKSTAGE_TRIPLE_QUALITY
              item.quality += NORMAL_QUALITY_CHANGE if item.quality < MAXIMUM_QUALITY
            end
          end
        end
      end

      item.sell_in -= NORMAL_QUALITY_CHANGE if item.name != 'Sulfuras, Hand of Ragnaros'

      if item.sell_in < SELL_BY_DATE
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > MINIMUM_QUALITY
              item.quality -= NORMAL_QUALITY_CHANGE if item.name != 'Sulfuras, Hand of Ragnaros'
            end
          else
            item.quality = MINIMUM_QUALITY
          end
        elsif item.quality < MAXIMUM_QUALITY
          item.quality += NORMAL_QUALITY_CHANGE
        end
      end
    end
  end
end

class GildedRose
  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  SELL_IN_REDUCTION = 1
  NORMAL_QUALITY_CHANGE = 1
  BACKSTAGE_DOUBLE_QUALITY = 10
  BACKSTAGE_TRIPLE_QUALITY = 5
  SELL_BY_DATE = 0
  SULFURAS = 'Sulfuras, Hand of Ragnaros'
  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      unless brie?(item) || passes?(item)
        item.quality -= NORMAL_QUALITY_CHANGE if !sulfuras?(item) && item.quality > MINIMUM_QUALITY
      else
        item.quality += NORMAL_QUALITY_CHANGE if item.quality < MAXIMUM_QUALITY
      end

      if passes?(item) && item.sell_in <= BACKSTAGE_DOUBLE_QUALITY
        item.quality += NORMAL_QUALITY_CHANGE if item.quality < MAXIMUM_QUALITY
        item.quality += NORMAL_QUALITY_CHANGE if item.sell_in <= BACKSTAGE_TRIPLE_QUALITY && item.quality < MAXIMUM_QUALITY
      end

      item.sell_in -= SELL_IN_REDUCTION if !sulfuras?(item)

      if item.sell_in < SELL_BY_DATE
        if brie?(item)
          item.quality += NORMAL_QUALITY_CHANGE unless item.quality >= MAXIMUM_QUALITY
        elsif !passes?(item)
          item.quality -= NORMAL_QUALITY_CHANGE if item.quality > MINIMUM_QUALITY && !sulfuras?(item)
        else
          item.quality = MINIMUM_QUALITY
        end
      end
    end
  end

  private

  def sulfuras?(item)
    item.name == SULFURAS
  end

  def brie?(item)
    item.name == AGED_BRIE
  end

  def passes?(item)
    item.name == BACKSTAGE_PASSES
  end
end

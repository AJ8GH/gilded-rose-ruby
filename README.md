======================================
Gilded Rose Requirements Specification
======================================

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.

Items
-----

- Regular item
- Aged Brie
- Backstage passes to a TAFKAL80ETC concert
- Sulfuras, Hand of Ragnaros
- Conjured items

Constraints
-----------

- item.quality never < 0
- item.quality never > 50 unless item == Sulfuras
- sulfuras.quality always == 80
- sulfuras.sell_in always == nil

Each Day
--------

sell in:
- item.sell_in -= 1 unless item == Sulfuras

quality:
- regular item:
- quality -= 2 if sell_in < 0 (unless quality <= 0)
- quality -= 1 if sell_in >= 0 (unless quality <= 0)

- brie:
  - quality += 1 (unless quality >= 50)

- backstage pass:
  - quality = 0 when sell_in < 0
  - quality += 3 if sell_in <=5 (unless quality >= 50)
  - quality += 2 if sell_in <=10 (unless quality >= 50)

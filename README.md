Gilded Rose in Ruby
===================

[![Build Status](https://travis-ci.com/AJ8GH/gilded-rose-ruby.svg?branch=main)](https://travis-ci.com/AJ8GH/gilded-rose-ruby)
[![Coverage Status](https://coveralls.io/repos/github/AJ8GH/gilded-rose-ruby/badge.svg?branch=main)](https://coveralls.io/github/AJ8GH/gilded-rose-ruby?branch=main)
[![Maintainability](https://api.codeclimate.com/v1/badges/862379c3a9bde553f298/maintainability)](https://codeclimate.com/github/AJ8GH/gilded-rose-ruby/maintainability)
[![BCH compliance](https://bettercodehub.com/edge/badge/AJ8GH/gilded-rose-ruby?branch=main)](https://bettercodehub.com/)

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

class BeerList
@@arr = "488
44
American-Style Pale Ale
388
American-Style Lager
291
American-Style Amber/Red Ale
289
American-Style Stout
284
American-Style India Pale Ale
237
Porter
218
American-Style Brown Ale
123
South German-Style Hefeweizen
119
Light American Wheat Ale or Lager
106
Traditional German-Style Bock
98
Imperial or Double India Pale Ale
96
German-Style Oktoberfest
69
American-Style Imperial Stout
59
Scotch Ale
50
Fruit Beer
50
Other Belgian-Style Ales
48
Belgian-Style White
47
Old Ale
44
German-Style Pilsener
43
American-Style Light Lager
38
American-Style Barley Wine Ale
32
Belgian-Style Tripel
32
Golden or Blonde Ale
31
Extra Special Bitter
29
German-Style Schwarzbier
29
Oatmeal Stout
26
English-Style Pale Mild Ale
25
French & Belgian-Style Saison
24
German-Style Heller Bock/Maibock
21
Winter Warmer
20
Irish-Style Red Ale
17
Pumpkin Beer
16
German-Style Doppelbock
15
Belgian-Style Fruit Lambic
15
German-Style Brown Ale/Altbier
13
American-Style Strong Pale Ale
12
American-Style Cream Ale or Lager
12
Dark American-Belgo-Style Ale
12
South German-Style Weizenbock
12
Sweet Stout
11
American Rye Ale or Lager
10
Belgian-Style Dubbel
10
Belgian-Style Pale Strong Ale
9
Belgian-Style Dark Strong Ale
9
Belgian-Style Pale Ale
9
Classic English-Style Pale Ale
9
Special Bitter or Best Bitter
8
English-Style India Pale Ale
8
Herb and Spice Beer
8
Ordinary Bitter
7
Belgian-Style Quadrupel
2
Strong Ale
2
Vienna-Style Lager
1
American-Style Dark Lager
1
American-Style India Black Ale
1
Imperial or Double Red Ale
1
Kellerbier - Ale
1
Out of Category
1
Scottish-Style Light Ale
1
Specialty Beer
1
Specialty Honey Lager or Ale"

def self.arr
    @@arr
end

@@newArr = self.arr.split("\n")

def self.newArr
    @@newArr
end

def self.beer
    @@beer
end

@@beer = []

def self.fixArr
    count = 0
    while count < self.newArr.count
        if count % 2 == 0
            self.beer << self.newArr[count]
        end
        count += 1
    end
end

self.fixArr

self.beer.shift

end


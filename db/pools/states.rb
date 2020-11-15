require 'pry'
module Pool
  class State
    NAMES = [
      'Body Hair',
      'Quizzitskip',
      'Tremendodelluh',
      'Cyanobacteria',
      'Snapdragons',
      'Angry Bees',
      'Ominous Buzzing',

    ]

    PREFIXES = [
      'the Republic of',
      'the Kingdom of',
      'the Isle of',
      'the Principality of',
      'the Commonwealth of',
      "the People's Democracy of",
      'the Great Floating',
      'the Eye of',
      'the Holy',
      'the Collective'

    ]

    SUFFIXES = [
      "Kingdom",
      'Isles',
      'States'
    ]

    def self.create_name
      # prefix = ''
      # suffix = ''
      prefix =  case rand(1..100)
                when 1..50
                  PREFIXES[rand(0...PREFIXES.length)] + ' '
                else
                  ''
                end
      # suffix = ''

      suffix =  case rand(1..100)
                when 1..25
                  ' ' + SUFFIXES[rand(0...SUFFIXES.length)]
                  if prefix == '' then 'the  ' end
                else
                  ''
                end
      prefix + NAMES[rand(0...NAMES.length)] + suffix
    end
  end
end

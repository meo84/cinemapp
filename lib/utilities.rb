module Utilities
  class MapLegend
    def self.legend
      {
        0..0 => "grey",
        1..1 => "#FCF7C5",
        2..5 => "#13747D",
        6..10 => "#FC354C",
        11..100 => "#000000"
      }
    end

    def self.country_color(nb_films)
      legend.select { |key| key === nb_films }.values.first
    end
  end
end

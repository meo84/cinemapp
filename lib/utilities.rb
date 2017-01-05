module Utilities
  class MapLegend
    
    #legend units: nb_movies => country colour on the map
    def legend
      {
        0..0 => "grey",
        1..1 => "#FCF7C5",
        2..5 => "#13747D",
        6..10 => "#FC354C",
        11..100 => "#000000"
      }
    end

    #return color depending of film number
    def country_color(nb_films)
      legend.select { |key| key === nb_films }.values.first 
    end  

    def title(range)
      res = range.begin.to_s
      res += ('-' + range.end.to_s) unless range.end == range.begin
      res += ' ' + 'film'.pluralize(range.end)
    end

    #legend displayed on the map
    def legend_with_text 

      legend_with_text = []

      legend().keys.each do |key|
        legend_with_text << {
          "title": title(key).to_s,
          "color": country_color(key.begin)
        }
      end
    	
      return legend_with_text
    end 
  end 
end
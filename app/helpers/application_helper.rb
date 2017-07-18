module ApplicationHelper
  def legend_with_text
    [{"title": "0 films", "color": "grey"},
      {"title": "1 film", "color": "#FCF7C5"},
      {"title": "2-5 films", "color": "#13747d"},
      {"title": "6-10 films", "color": "#fc354c"},
      {"title": "10+ films", "color": "#000"}]
  end

  def concatenate_links(directors)
    links = directors.map { |director| link_to director.fullname, director_path(director) }
    links.to_sentence.html_safe
  end
end

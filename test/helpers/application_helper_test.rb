require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  def test_legend_with_text
    assert_equal [{"title": "0 films", "color": "grey"},
      {"title": "1 film", "color": "#FCF7C5"},
      {"title": "2-5 films", "color": "#13747d"},
      {"title": "6-10 films", "color": "#fc354c"},
      {"title": "10+ films", "color": "#000"},
    ],
    legend_with_text
  end
end

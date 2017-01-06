require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  def test_legend_with_test_api
    assert_equal [], legend_with_text
  end
end

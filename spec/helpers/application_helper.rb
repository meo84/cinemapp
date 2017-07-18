require 'spec_helper'

describe ApplicationHelper do
  describe '#concatenate_links' do
    context 'When there is 1 director' do
      it 'returns the html link of the director page' do
        director = FactoryGirl.create :director
        show_link = "<a href=\"/directors/#{director.id}\">#{ director.fullname }</a>"
        expect(helper.concatenate_links([director])).to eq show_link
      end
    end

    context 'When there are 2 directors' do
      it 'returns the html links of the directors separated by "and"' do
      first_director = FactoryGirl.create :director
      second_director = FactoryGirl.create :director
      first_show_link = "<a href=\"/directors/#{first_director.id}\">#{ first_director.fullname }</a>"
      second_show_link = "<a href=\"/directors/#{second_director.id}\">#{ second_director.fullname }</a>"


      expect(helper.concatenate_links([first_director, second_director])).to eq first_show_link + ' and ' + second_show_link
      end
    end

    context 'When there are more than 2 directors' do
      it 'returns the html links of the directors separated by commas' do
      first_director = FactoryGirl.create :director
      second_director = FactoryGirl.create :director
      third_director = FactoryGirl.create :director
      first_show_link = "<a href=\"/directors/#{first_director.id}\">#{ first_director.fullname }</a>"
      second_show_link = "<a href=\"/directors/#{second_director.id}\">#{ second_director.fullname }</a>"
      third_show_link = "<a href=\"/directors/#{third_director.id}\">#{ third_director.fullname }</a>"

      expect(helper.concatenate_links([first_director, second_director, third_director])).to eq first_show_link + ', ' + second_show_link + ', and ' + third_show_link
      end
    end
  end
end

require 'spec_helper'

module Alchemy
  describe 'Fulltext search' do
    let(:search_page) { FactoryGirl.create(:public_page, name: 'Suche', page_layout: 'search', do_not_autogenerate: false) }
    let(:public_page) { FactoryGirl.create(:public_page, visible: true, name: 'Page 1') }
    let(:element) { FactoryGirl.create(:element, page: public_page, create_contents_after_create: true) }

    before { search_page }

    it "should have a correct path in the form tag" do
      visit('/suche')
      page.should have_selector('div#content form[action="/suche"]')
    end

    context "performing the search" do

      it "should display search results for richtext essences" do
        element.content_by_name('text').essence.update_attributes(body: '<p>Welcome to Peters Petshop</p>')
        visit('/suche?query=Petshop')
        within('div#content .search_result') { page.should have_content('Petshop') }
      end

      it "should display search results for text essences" do
        element.content_by_name('headline').essence.update_attributes(body: 'Welcome to Peters Petshop')
        visit('/suche?query=Petshop')
        within('div#content .search_result') { page.should have_content('Petshop') }
      end

      it "should not find contents placed on global-pages layoutpage: true)" do
        public_page.update_attributes(layoutpage: true)
        element.content_by_name('headline').essence.update_attributes(body: 'Welcome to Peters Petshop')
        visit('/suche?query=Petshop')
        within('div#content') { page.should have_css('h2.no_search_results') }
      end

      it "should not find contents placed on unpublished pages public: false)" do
        public_page.update_attributes(public: false)
        element.content_by_name('headline').essence.update_attributes(body: 'Welcome to Peters Petshop')
        visit('/suche?query=Petshop')
        within('div#content') { page.should have_css('h2.no_search_results') }
      end

      it "should not find contents placed on restricted pages restricted: true)" do
        public_page.update_attributes(restricted: true)
        element.content_by_name('headline').essence.update_attributes(body: 'Welcome to Peters Petshop')
        visit('/suche?query=Petshop')
        within('div#content') { page.should have_css('h2.no_search_results') }
      end

      context "in multi_language mode" do

        let(:english_language)      { FactoryGirl.create(:english) }
        let(:english_language_root) { FactoryGirl.create(:language_root_page, language: english_language, name: 'Home') }
        let(:english_page)          { FactoryGirl.create(:public_page, parent_id: english_language_root.id, language: english_language) }
        let(:english_element)       { FactoryGirl.create(:element, page_id: english_page.id, name: 'article', create_contents_after_create: true) }

        before do
          element
          english_element
          PagesController.any_instance.stub(:multi_language?).and_return(true)
        end

        it "should not display search results from other languages then current" do
          english_element.content_by_name('headline').essence.update_attributes(body: 'Joes Hardware')
          visit('/de/suche?query=Hardware')
          within('div#content') { page.should have_css('h2.no_search_results') }
          page.should_not have_css('div#content .search_result')
        end

      end

    end
  end
end

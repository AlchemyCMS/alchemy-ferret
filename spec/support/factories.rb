FactoryGirl.define do

  factory :language, class: 'Alchemy::Language' do
    name 'Deutsch'
    code 'de'
    default true
    frontpage_name 'Intro'
    page_layout 'intro'
    public true
    site { Alchemy::Site.first }

    factory :english do
      name 'English'
      code 'en'
      frontpage_name 'Intro'
      default false
    end
  end

  factory :page, class: 'Alchemy::Page' do
    language { Alchemy::Language.get_default || FactoryGirl.create(:language) }
    sequence(:name) { |n| "A Page #{n}" }
    parent_id { (Alchemy::Page.find_by_language_root(true) || FactoryGirl.create(:language_root_page)).id }
    page_layout "standard"

    # This speeds up creating of pages dramatically. Pass `do_not_autogenerate: false` to generate elements
    do_not_autogenerate true

    factory :language_root_page do
      name 'Startseite'
      page_layout 'intro'
      language_root true
      public true
      parent_id { Alchemy::Page.root.id }
    end

    factory :public_page do
      sequence(:name) { |n| "A Public Page #{n}" }
      public true
    end
  end

  factory :element, class: 'Alchemy::Element' do
    name 'article'
    create_contents_after_create false
  end

end

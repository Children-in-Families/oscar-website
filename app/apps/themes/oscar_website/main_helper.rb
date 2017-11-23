module Themes::OscarWebsite::MainHelper
  def self.included(klass)
    klass.helper_method [:oscar_get_nav_menu] rescue "" # here your methods accessible from views
  end

  def oscar_website_settings(theme)
    # callback to save custom values of fields added in my_theme/views/admin/settings.html.erb
  end

  # callback called after theme installed
  def oscar_website_on_install_theme(theme)
    oscar_add_customize_theme_setting(theme)
    oscar_add_default_pages
    oscar_add_fields_to_home_page
  end

  def oscar_add_default_pages
    page_post_type = current_site.the_post_type('page')
    if page_post_type.present?
      pages = ['Home']

      pages.each do |page|
        formatted_page = page.downcase.parameterize
        exist_page = current_site.the_post_type('page').the_posts.where("slug like '%#{formatted_page}%'")
        unless exist_page.present?
          page_post_type.add_post(title: page, content: 'lorem_ipsum')
        end
      end
    end
  end

  def oscar_add_fields_to_home_page
    page = current_site.the_post_type('page').the_post('home')

    if page.get_field_groups.where(slug: 'home-introduction').blank?
      home_field_group = page.add_field_group({ name: 'Home Introduction', slug: 'home-introduction' })
      home_field_group.add_field({ name: 'Introduction Sentence', slug: 'introdution-sentence' }, { field_key: 'text_box', required: true, default_value: 'The fastest way to grow your business with the leader in'})
      home_field_group.add_field({ name: 'Big Word', slug: 'big-word' }, { field_key: 'text_box', required: true, default_value: 'Technology'})
      home_field_group.add_field({ name: 'Option And Feature', slug: 'option-and-feature' }, { field_key: 'text_box', required: true, default_value: 'Check out our options and features included.'})
      home_field_group.add_field({ name: 'Get Start Now', slug: 'get-start-now' }, { field_key: 'url', required: true, default_value: 'https://www.google.com.kh/'})
      home_field_group.add_field({ name: 'Learn More', slug: 'learn-more' }, { field_key: 'url', required: true, default_value: 'https://www.google.com.kh/'})
    end
  end

  def oscar_add_customize_theme_setting(theme)
    if theme.get_field_groups.where(slug: 'social-media').blank?
      group = theme.add_field_group({name: 'Social Media', slug: 'social-media'})
      group.add_field({ name: 'Facebook Url', slug: 'facebook-url' }, { field_key: 'url', require: false })
      group.add_field({ name: 'Twitter Url', slug: 'twitter-url' }, { field_key: 'url' })
      group.add_field({ name: 'Linkedin Url', slug: 'linkedin-url' }, { field_key: 'url' })

    end

    if theme.get_field_groups.where(slug: 'home-slider').blank?
      group = theme.add_field_group({name: 'Home Slider', slug: 'home-slider'})
      group.add_field({ name: 'Image Slider', slug: 'image-slider' }, { field_key: 'image', require: true })
      group.add_field({ name: 'Video Slider', slug: 'video-slider' }, { field_key: 'video', require: false })
      group.add_field({ name: 'First Text Load', slug: 'first-text-load' }, { field_key: 'text_box' })
      group.add_field({ name: 'Second Text Load', slug: 'second-text-load' }, { field_key: 'text_box' })
      group.add_field({ name: 'Third Text Load', slug: 'third-text-load' }, { field_key: 'text_box' })
    end
  end

  def oscar_get_nav_menu(key = 'main_menu', class_name = "navigation")
    option = {
      menu_slug: key,
      container_class: class_name,
      container_id: 'main-menu-ul',
      item_class_parent: 'dropdown mega-dropdown',
      sub_class:        'dropdown-menu mega-dropdown-menu row',
      callback_item: lambda do |args|
        args[:link_attrs] = "data-title='#{args[:link][:name].parameterize}'"
        if args[:has_children]
          args[:settings][:after] = "<span class='dropdown-icon'><i class='fa fa-angle-down' aria-hidden='true'></i></span>"
          args[:link_attrs] += "data-toggle='dropdown'"
        end
      end
    }
    draw_menu(option)
  end

  # callback executed after theme uninstalled
  def oscar_website_on_uninstall_theme(theme)
  end
end

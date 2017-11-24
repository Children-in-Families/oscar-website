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
    oscar_add_home_feature_post_type
    oscar_add_home_customer_image_post_type
    oscar_add_home_latest_blog_post_post_type
    oscar_add_what_clients_say_post_type
    oscar_add_latest_tweets_post_type
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

    if page.get_field_groups.where(slug: 'home-concept').blank?
      home_field_group = page.add_field_group({ name: 'Home Concept', slug: 'home-concept' })
      home_field_group.add_field({ name: 'Project Name', slug: 'project-name' }, { field_key: 'text_box', required: true, default_value: 'Oscar Website'})
      home_field_group.add_field({ name: 'Slide Word', slug: 'concept-slide-word' }, { field_key: 'text_box', required: true, default_value: 'Website', multiple: true})
      home_field_group.add_field({ name: 'Project Meaning', slug: 'project-meaning' }, { field_key: 'text_box', required: true, default_value: 'help children in Cambodia'})
      home_field_group.add_field({ name: 'Concept Description', slug: 'concept-description' }, { field_key: 'text_box', required: true, default_value: 'We help all children in Camodia'})
    end

    if page.get_field_groups.where(slug: 'home-customer-description').blank?
      home_field_group = page.add_field_group({ name: 'Home Customer Description', slug: 'home-customer-description' })
      home_field_group.add_field({ name: 'Main First Description', slug: 'main-first-description' }, { field_key: 'text_box', required: true, default_value: 'Our Customer'})
      home_field_group.add_field({ name: 'Slide Word', slug: 'customer-description-slide-word' }, { field_key: 'text_box', required: true, default_value: 'Happy', multiple: true})
      home_field_group.add_field({ name: 'Main Scecond Description', slug: 'main-second-description' }, { field_key: 'text_box', required: true, default_value: 'to help children in Cambodia'})
      home_field_group.add_field({ name: 'Sub Description', slug: 'sub-description' }, { field_key: 'text_box', required: true, default_value: '25,000 customers in 100 countries use Porto Template. Meet our customers.'})
    end
  end

  def oscar_add_home_feature_post_type
    if current_site.the_post_type('home-feature').blank?
      feature = current_site.post_types.create(name: 'Home Feature', slug: 'home-feature')
      options = {
        has_category: false,
        has_content: true,
        has_tags: false,
        has_summary: false,
        has_comments: false,
        has_picture: false,
        has_template: false,
        has_keywords: false,
        contents_route_format: 'post_of_posttype'
      }
      feature.set_meta('_default', options)
      if feature.get_field_groups.where(slug: 'home-feature-feilds').blank?
        feature_field_group = feature.add_field_group({ name: 'Home feature fields', slug: 'home-feature-fields' } )

        feature_field_group.add_field({ name: 'Feature Icon', slug: 'feature-icon' }, { field_key: 'image', required: true } )
        feature_field_group.add_field({ name: 'Feature Url', slug: 'Feature-url' }, { field_key: 'url', required: true } )
      end
    end
  end

  def oscar_add_home_customer_image_post_type
    if current_site.the_post_type('home-customer-image').blank?
      customer = current_site.post_types.create(name: 'Home Customer Image', slug: 'home-customer-image')
      options = {
        has_category: false,
        has_content: true,
        has_tags: false,
        has_summary: false,
        has_comments: false,
        has_picture: false,
        has_template: false,
        has_keywords: false,
        contents_route_format: 'post_of_posttype'
      }
      customer.set_meta('_default', options)
      if customer.get_field_groups.where(slug: 'home-customer-image-feilds').blank?
        customer_field_group = customer.add_field_group({ name: 'Home Customer Image fields', slug: 'home-customer-image-fields' } )
        customer_field_group.add_field({ name: 'Customer Logo', slug: 'customer-logo' }, { field_key: 'image', required: true } )
      end
    end
  end

  def oscar_add_home_latest_blog_post_post_type
    if current_site.the_post_type('home-latest-blog-post').blank?
      post = current_site.post_types.create(name: 'Home Latest Blog Post', slug: 'home-latest-blog-post')
      options = {
        has_category: false,
        has_content: true,
        has_tags: false,
        has_summary: false,
        has_comments: false,
        has_picture: false,
        has_template: false,
        has_keywords: false,
        contents_route_format: 'post_of_posttype'
      }
      post.set_meta('_default', options)
      if post.get_field_groups.where(slug: 'home-latest-blog-post-feilds').blank?
        post_field_group = post.add_field_group({ name: 'Home Latest Blog Post fields', slug: 'home-latest-blog-post-feilds' } )
        post_field_group.add_field({ name: 'Date', slug: 'date' }, { field_key: 'date', required: true } )
        post_field_group.add_field({ name: 'Post Title', slug: 'post-title' }, { field_key: 'text_box', required: true } )
        post_field_group.add_field({ name: 'Post Title Url', slug: 'post-url' }, { field_key: 'url', required: true } )
        post_field_group.add_field({ name: 'Post Content', slug: 'post-content' }, { field_key: 'text_area', required: true } )
      end
    end
  end

  def oscar_add_what_clients_say_post_type
    if current_site.the_post_type('home-what-clients-say').blank?
      post = current_site.post_types.create(name: 'What Clients Say', slug: 'home-what-clients-say')
      options = {
        has_category: false,
        has_content: true,
        has_tags: false,
        has_summary: false,
        has_comments: false,
        has_picture: false,
        has_template: false,
        has_keywords: false,
        contents_route_format: 'post_of_posttype'
      }
      post.set_meta('_default', options)
      if post.get_field_groups.where(slug: 'home-what-clients-say-feilds').blank?
        post_field_group = post.add_field_group({ name: 'Home What Clients Say fields', slug: 'home-what-clients-say-feilds' } )
        post_field_group.add_field({ name: 'What Client Say', slug: 'what-client-say' }, { field_key: 'text_area', required: true } )
        post_field_group.add_field({ name: 'Client Image', slug: 'client-image' }, { field_key: 'image', required: true } )
        post_field_group.add_field({ name: 'Client Name', slug: 'client-name' }, { field_key: 'text_box', required: true } )
        post_field_group.add_field({ name: 'Client Position', slug: 'client-position' }, { field_key: 'text_box', required: true } )
      end
    end
  end

  def oscar_add_latest_tweets_post_type
    if current_site.the_post_type('home-latest-tweets').blank?
      tweet = current_site.post_types.create(name: 'Tweets', slug: 'home-tweets')
      options = {
        has_category: false,
        has_content: true,
        has_tags: false,
        has_summary: false,
        has_comments: false,
        has_picture: false,
        has_template: false,
        has_keywords: false,
        contents_route_format: 'post_of_posttype'
      }
      tweet.set_meta('_default', options)
      if tweet.get_field_groups.where(slug: 'home-latest-tweets-feilds').blank?
        post_field_group = tweet.add_field_group({ name: 'Home Tweets fields', slug: 'home-tweets-feilds' } )
        post_field_group.add_field({ name: 'Tweet Content', slug: 'tweet-content' }, { field_key: 'text_area', required: true } )
        post_field_group.add_field({ name: 'Tweet Date', slug: 'tweet-date' }, { field_key: 'date', required: true } )
      end
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

    if theme.get_field_groups.where(slug: 'contact-us').blank?
      group = theme.add_field_group({name: 'Contact Us', slug: 'contact-us'})
      group.add_field({ name: 'Address', slug: 'contact-address' }, { field_key: 'text_box', require: true })
      group.add_field({ name: 'Phone', slug: 'contact-phone' }, { field_key: 'phone', require: true })
      group.add_field({ name: 'Email', slug: 'contact-email' }, { field_key: 'email', require: true })
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

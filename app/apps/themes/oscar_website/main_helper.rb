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

module Themes::OscarWebsite::LanguageHelper
  def self.included(klass)
    klass.helper_method [:oscar_language] rescue ""
  end

  def oscar_language(lang)
    locales = %w(en km).map { |l| l.prepend '/'  }
    if is_post_type?
      "#{@post_type.the_url.sub(Regexp.union(locales), '')}/?locale=#{lang}"
    else
      url_for(locale: :"#{lang}")
    end
  end
end
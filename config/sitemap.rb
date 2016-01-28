# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://xn--80aal0a7a.xn--j1amh"

SitemapGenerator::Sitemap.create do
  def category_path(category)
    unless category.is_root?
      category_long_path category.parent, category
    else
      category_short_path category
    end
  end

  def category_product_path(category, product)
    unless category.is_root?
      category_product_long_path category.parent, category, product
    else
      category_product_short_path category, product
    end
  end


  add articles_path
  add products_path
  add new_user_session_path, priority: 0.0

  Page.find_each do |page|
      add page_path(page.slug), :lastmod => page.updated_at
  end

  Article.find_each do |article|
      add article_path(article), :lastmod => article.updated_at
  end

  Product.find_each do |product|
      add category_product_path(product.categories.first, product), :lastmod => product.updated_at
  end

  Category.find_each do |category|
      add category_path(category), :lastmod => category.updated_at
  end
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end

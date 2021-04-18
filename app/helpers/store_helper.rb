module StoreHelper
  def product_feature features

    return if features.nil? or features.empty?

    message = case features
      when "sale"
        "Акция"
      when "new"
        "Новинка"
      else "gift"
        "Бесплатная доставка"
    end

    html = <<-HTML
    <div class="ribbon #{features}" >
        <div class="theribbon" style="margin-top: 0;">#{message}</div>
        <div class="ribbon-background"></div>
    </div>
    HTML

    html.html_safe
  end
end

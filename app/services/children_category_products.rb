class ChildrenCategoryProducts
  def initialize(category)
    @category = category
  end

  def products
    Product.includes(:category).where(category_id: all_category_ids)
  end

  private

  def all_category_ids
    return @category.id unless @category.has_children?
    [@category.id] + @category.children.map(&:id)
  end
end

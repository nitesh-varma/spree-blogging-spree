class Spree::BlogEntryImage < Spree::Image

 def self.styles
    @styles ||= {
      mini: '48x48>',
      small: '100x100>',
      product: '360x360>',
      large: '1000x800>'
    }
  end

end

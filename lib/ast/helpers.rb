module Helpers
  def self.blocks_to_s(blocks)
    list_items = []
    block_children = blocks.map(&:child)
    block_children.each_with_index do |e, i|
      cur_is_par = e.instance_of?(Paragraph)
      next_is_par = block_children[i+1].instance_of?(Paragraph)

      if cur_is_par && next_is_par
        list_items.push "#{e} \\\\"
      else
        list_items.push e
      end
    end
    list_items.join("\n\n")
  end
end
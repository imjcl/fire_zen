module ZenHelper
  def likes_dislikes num
    num = 0 if num.nil?

    num
  end

  def font_bg_randomizer
    "font-bg-#{(Random.new.rand(6) + 1).to_s}"
  end
end
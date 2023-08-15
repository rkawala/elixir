defmodule PaintByNumber do
  def palette_bit_size(color_count), do: count_palette_bits(color_count - 1)

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    hd(separate_first_and_rest(picture, color_count, nil))
  end

  def drop_first_pixel(picture, color_count) do
    tl(separate_first_and_rest(picture, color_count, <<>>))
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end

  defp count_palette_bits(0), do: 0
  defp count_palette_bits(color_count) do
    1 + count_palette_bits(Bitwise.bsr(color_count, 1))
  end

  defp separate_first_and_rest(picture, color_count, empty_element) do
    if (picture == <<>>) do
      [ empty_element | empty_element ]
    else
      pixel_size = palette_bit_size(color_count)
      <<first_pixel::size(pixel_size), rest::bitstring>> = picture
      [ first_pixel | rest ]
    end
  end
end

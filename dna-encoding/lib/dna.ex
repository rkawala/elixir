defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0
      ?A -> 1
      ?C -> 2
      ?G -> 4
      ?T -> 8
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0 -> ?\s
      1 -> ?A
      2 -> ?C
      4 -> ?G
      8 -> ?T
    end
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_encode([], encoded_bitstring), do: encoded_bitstring
  defp do_encode([ head | tail ], encoded_bitstring) do
    do_encode(tail, <<encoded_bitstring::bitstring, encode_nucleotide(head)::size(4) >>)
  end

  def decode(dna) do
    do_decode(dna, [])
  end

  defp do_decode(<<>>, decoded_string), do: decoded_string
  defp do_decode(<< nucleotide::size(4), rest::bitstring >>, decoded_string) do
    do_decode(rest, decoded_string ++ [ decode_nucleotide(nucleotide) ])
  end
end

defmodule FileSniffer do

  @types [
    %{ file_ext: "exe", signature: <<0x7F, 0x45, 0x4C, 0x46>>, desc: "application/octet-stream"},
    %{ file_ext: "bmp", signature: <<0x42, 0x4D>>, desc: "image/bmp"},
    %{ file_ext: "png", signature: <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>>, desc: "image/png"},
    %{ file_ext: "jpg", signature: <<0xFF, 0xD8, 0xFF>>, desc: "image/jpg"},
    %{ file_ext: "gif", signature: <<0x47, 0x49, 0x46>>, desc: "image/gif"},
  ]

  def type_from_extension(extension) do
    type_from_lambda(&(&1.file_ext == extension))
  end

  def type_from_binary(file_binary) do
    file_size = byte_size(file_binary)
    type_from_lambda(fn entry ->
      signature_size = byte_size(entry.signature)
      if file_size > signature_size do
        << start::binary-size(signature_size), _rest::binary>> = file_binary
        entry.signature == start
      else
        false
      end
      end)
  end

  def verify(file_binary, extension) do
    from_ext = type_from_extension(extension)
    from_sig = type_from_binary(file_binary)
    cond do
      from_ext && from_ext == from_sig -> { :ok, from_ext }
      true -> { :error, "Warning, file format and file extension do not match." }
    end
  end

  defp type_from_lambda(lambda) do
    entry = Enum.find(@types, lambda)
    cond do
      entry -> entry.desc
      true -> nil
    end
  end
end

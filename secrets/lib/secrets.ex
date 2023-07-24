defmodule Secrets do
  def secret_add(secret) do
    &(&1 + secret)  # I wanted to try the shorthand syntax.
  end

  def secret_subtract(secret) do
    fn data -> data - secret end
  end

  def secret_multiply(secret) do
    fn data -> data * secret end
  end

  def secret_divide(secret) do
    fn data -> div(data, secret) end
  end

  def secret_and(secret) do
    &(Bitwise.band(&1, secret))
  end

  def secret_xor(secret) do
    fn data -> Bitwise.bxor(data, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn data -> secret_function2.(secret_function1.(data)) end  # Note the dots. Dot is the "invoke function" operator.
  end
end

defmodule ComplementarityFunc do

 def complementarity(strand) when is_binary(strand) do
   strand
   |> convert_letters
   |> Enum.map(fn
       "A" -> "T"
       "T" -> "A"
       "C" -> "G"
       "G" -> "C"
       _ -> raise "Incorrect nucleotide -> `Nucleotides [A, C, T, G]`"
   end)
   |> List.to_string
 end

 def convert_letters(strand) do
   String.graphemes(strand)
   |> Enum.map(fn x -> String.upcase(x) end)
  end

end

-- Macht aus index.qmd ein Redeskript: Folientitel + Speaker Notes, sonst nichts.
-- Folien werden wie in Reveal.js gezählt (Titelfolie = 1, jede #- und ##-Überschrift eine Folie).

function Pandoc(doc)
  local out = {}
  local folie = 1

  for _, block in ipairs(doc.blocks) do
    if block.t == "Header" and block.level <= 2 then
      folie = folie + 1
      local titel = pandoc.utils.stringify(block.content)
      local header = pandoc.Header(block.level, "Folie " .. folie .. ": " .. titel)
      header.classes = { "unnumbered" }
      table.insert(out, header)
    elseif block.t == "Div" and block.classes:includes("notes") then
      for _, inner in ipairs(block.content) do
        table.insert(out, inner)
      end
    end
  end

  doc.blocks = out
  return doc
end

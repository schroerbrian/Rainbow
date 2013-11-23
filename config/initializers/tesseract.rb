TESSERACT = Tesseract::Engine.new {|e|
  e.language  = :eng
  e.blacklist = '|'
}


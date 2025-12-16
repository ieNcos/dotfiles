return {
    "let-def/texpresso.vim",
    lazy = false,
    cmd = 'TeXpresso',
    config = function()
      local texpresso = require 'texpresso'
      texpresso.texpresso_path = '/home/ieNcos/.nix-profile/bin/texpresso'
    end,
}

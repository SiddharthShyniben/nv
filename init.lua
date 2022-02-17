local options = {}

local _, opts = pcall(require, 'nv.config')
if opts then options = opts end

require('nv.plugins')
require('nv.options')(options.options)
require('nv.mappings')(options.mappings)
require('nv.internal')

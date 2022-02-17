require('impatient')

local options = {}

local _, opts = pcall(require, 'nv.config')
if opts then options = opts end

if type(options) ~= 'table' then options = {} end

require('nv.plugins')
require('nv.options')(options.options)
require('nv.mappings')(options.mappings)
require('nv.internal')

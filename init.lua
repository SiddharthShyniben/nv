pcall(require, 'impatient')

local options = {}
local defaultOptions = require('nv.default-config')

local _, opts = pcall(require, 'nv.config')
if opts then options = opts end

if type(options) ~= 'table' then options = {} end

options = vim.tbl_deep_extend('force', options, defaultOptions)

require('nv.plugins')(options)
require('nv.options')(options)
require('nv.mappings')(options)
require('nv.internal')

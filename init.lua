local options = require('nv.config') or {}

require('nv.plugins')
require('nv.options')(options.options)
require('nv.mappings')(options.mappings)

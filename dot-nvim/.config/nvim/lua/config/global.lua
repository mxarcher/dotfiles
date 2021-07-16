-- 设置模块全局环境为global
local global={}

-- 定义模块私有变量
local OS = vim.env.OS

global.is_mac = OS=="Darwin"
global.is_linux = OS=="Linux"
global.is_windows = OS=="Windows_NT"
global.CONFIG_PATH = vim.fn.stdpath("config")
global.DATA_PATH = vim.fn.stdpath("data")
global.CACHE_PATH = vim.fn.stdpath("cache")

return global

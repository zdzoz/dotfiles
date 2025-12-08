---@meta

---@class premake
premake = {
	api = {},
	vstudio = {},
	tools = { msc = {} },
	option = {},
	w = function(str) end,
	push = function(str) end,
	pop = function(str) end,
}

premake.override = function(obj, str, func) end

---@class io
io = {}
function io.readfile(filename) end

---@param filename string
---@param buffer string
function io.writefile(filename, buffer) end

---@class os
os = {
	systemTags = {},
}

function os.execute(command) end

function os.executef(command, args, ...) end

---@param path string
---@return boolean
function os.isdir(path) end

---@param path string
---@return boolean
function os.isfile(path) end

---@param path string
function os.mkdir(path) end

---@param path string
function os.rmdir(path) end

---@return string
function os.getcwd() end

---@param str string
---@return string
function os.getenv(str) end

---@class string
string = {}

function string.explode(str, separator) end

---@class path
path = {}

function path.getbasename(path) end

---Joins two path portions together into a single path.
---@param a string
---@param b string
---@param ... string
---@return string
function path.join(a, b, ...) end

---Returns the absolute file path.
---@param path string
---@return string
function path.getabsolute(path) end

---The path.getrelative function computes a relative path from one directory to
---another.
---@param src string
---@param dst string
---@return string
function path.getrelative(src, dst) end

---@param path string
---@return string
function path.getbasename(path) end

---@param path string
---@return string
function path.getdirectory(path) end

---@type table
_OPTIONS = {}

---@type string
_TARGET_OS = ""

---@type string
_ACTION = ""

---@type string
_OS = ""

---@type table
_ARGS = {}

---* Formatted print to stdout.
function printf(...) end

---* Include a premake lua file.
function include(filename) end

function includedirs(arr) end

function resincludedirs(arr) end

function externalincludedirs(arr) end

function libdirs(arr) end

function prebuildcommands(arr) end

function postbuildcommands(arr) end

---@param type string
function architecture(type) end

---@param type string
function system(type) end

function links(arr) end

function defines(arr) end

function pchheader(str) end

function pchsource(str) end

---@param version string e.g. v142
function toolset(version) end

function disablewarnings(arr) end

function filter(arr) end

function project(name) end

---Define a new workspace.
---@param name string
function workspace(name) end

---@param name string
function targetname(name) end

---@param str string
function entrypoint(str) end

function kind(name) end

function dpiawareness(type) end

function debugdir(path) end

function targetdir(path) end

function objdir(path) end

function files(arr) end

function excludes(arr) end

function removefiles(arr) end

function startproject(name) end

function configurations(arr) end

function cppdialect(type) end

function location(path) end

function language(type) end

function platforms(arr) end

---Define a new premake CLI option.
---@param table table
function newoption(table) end

function newaction(table) end

function rtti(value) end

function symbols(value) end

function buildoptions(arr) end

function linkoptions(arr) end

function project() end

function objdir(path) end

function targetsuffix(str) end

function omitframepointer(type) end

function runtime(type) end

function editandcontinue(type) end

function optimize(type) end

function vectorextensions(type) end

function warnings(type) end

function characterset(type) end

function nativewchar(type) end

function systemversion(version) end

function xcodebuildsettings(table) end

function exceptionhandling(type) end

function flags(flags) end

---@param path string
function pchheader(path) end

---@param path string
function pchsource(path) end

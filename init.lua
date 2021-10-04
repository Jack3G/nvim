-- Make sure core is always reloaded instead of cached
package.loaded["core"] = nil

require("core")

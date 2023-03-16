import "base/native/DB_001" for DBManager
import "base/native/Environment_001" for Environment

var post_shaders = DBManager.register_asset_hook("core/shaders/post", "shaders")
post_shaders.plain_file = "%(Environment.mod_directory)/core/shaders/post.shaders"
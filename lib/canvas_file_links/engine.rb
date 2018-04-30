# Copyright (C) 2018 Atomic Jolt

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

module CanvasFileLinks
  NAME = "Canvas File Links".freeze
  DISPLAY_NAME = "Static Files Served Outside Canvas Chrome".freeze
  DESCRIPTION =
    "Allows for serving files outside of Canvas Chrome that can follow relative paths".freeze
  class Engine < ::Rails::Engine
    config.autoload_paths << File.expand_path(File.join(__FILE__, "../.."))

    config.to_prepare do
      Canvas::Plugin.register(
        :canvas_file_links,
        nil,
        name: -> { I18n.t(:canvas_file_links_name, NAME) },
        display_name: -> { I18n.t :canvas_file_links_display, DISPLAY_NAME },
        author: "Atomic Jolt",
        author_website: "http://www.atomicjolt.com/",
        description: -> { t(:description, DESCRIPTION) },
        version: CanvasFileLinks::VERSION,
        settings: {
          valid_contexts: %w{Account Course},
        },
      )
      require "canvas_file_links/canvas_file_links_controller"
    end
  end
end

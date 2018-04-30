# Canvas File Links
This plugin enables serving files statically outside of the Canvas chrome.  It follows the following link path structure:

`/courses/:course_id/files/:file_id/static`

Placing a link strutured like the above example as an `href` for a link in a Canvas Page or similar, will redirect the user to that file served without the Canvas chrome.  The file that gets served will have access to relative urls referenced from that file itself, like a `.css` file kept in the same folder as an `.html` file that references it.


## Installation
Clone this repo into the Canvas Plugins directory on your app server:
```sh
sysadmin@appserver:~$ cd /path/to/canvas/gems/plugins
sysadmin@appserver:/path/to/canvas/gems/plugins$ git clone https://github.com/atomicjolt/canvas_file_links.git
```

Now `bundle install` and `bundle exec rake canvas:compile_assets` and `rails server`.

After it is up, login with the site admin account and head over to the `/plugins` route (Navigated to by clicking `Admin -> Site Admin -> Plugins`).
Once there, scroll down to `Canvas File Links` and click into it.  Enable the plugin.

You should be all set now. Enjoy!

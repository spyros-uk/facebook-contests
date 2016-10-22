# Plugin Suggestions

**Step 1. Copy the `mu-plugins` folder into your `wp-content` directory.**
It is required by some of the following in-house plugins to function correctly.

## Basic Functionality
### _Should generally be installed in all projects_

| Feature                      | Plugin                                                                                                |
|------------------------------|-------------------------------------------------------------------------------------------------------|
| Caching                      | W3 Total Cache                                                                                        |
| Custom Fields                | Advanced Custom Fields PRO                                                                            |
| Reusable Custom Fields       | [Advanced Custom Fields: Reusable Field Group](https://github.com/mvpdesign/acf-reusable-field-group) |
| Custom Post Types/Taxonomies | SDP - Project Functionality                                                                        |
| Form Handling                | Contact Form 7 (+ CF7 Template Support)                                                               |
| Image Cropping               | Manual Image Crop                                                                                     |
| Multiple Languages           | WPML (+ WPML String Translation + WPML Media)                                                         |
| Rebuilding Images            | AJAX Thumbnail Rebuild                                                                                |
| SEO                          | Yoast SEO for WordPress                                                                               |

## Extra Functionality
### _Install based on project requirements_

| Feature                      | Plugin                                                                                                |
|------------------------------|-------------------------------------------------------------------------------------------------------|
| Better WP Search Results     | Relevanssi                                                                                            |
| Content Likes/Favorites      | SDP - Content Likes                                                                                |
| Disabling Comments           | Disable Comments                                                                                      |
| Events                       | SDP - Events                                                                                       |
| Mailchimp Newsletter Signup  | SDP - Mailchimp                                                                                    |
| Nav Post Type Archive Links  | Post Type Archive Links                                                                               |
| Nearest Locations Lookup     | SDP - Geo                                                                                          |
| Send Emails through SMTP     | WP Mail SMTP (requires Mandrill account)                                                              |
| Social Feeds FB/TW/Inst      | SDP - Social Media Aggregator                                                                                      |
| Sorting Posts                | Simple Custom Post Order                                                                              |

## WP-API specific
### _Install if you want to work with the wp-api_

| Feature                      | Plugin                                                                                                |
|------------------------------|-------------------------------------------------------------------------------------------------------|
| WordPress JSON REST API      | WP REST API                                                                                           |
| add ACF Support to API       | ACF to REST API                                                                                       |
| add WPML Support to API      | WPML to WP API                                                                                        |
| add Yoast SEO Support to API | SDP - WP API SEO                                                                                   |
| Support CORS                 | WP-CORS                                                                                               |
| add Nav Menus to API         | [WP REST API Menus](https://github.com/nekojira/wp-api-menus)                                         |

_**Note**: while building with the API you might find yourself wanting to spoof theme page
 templates without adding empty templates to your theme (as rules for ACF, etc). If so,
 check out [this handy script](https://gist.github.com/Maximilianos/b21020ecceaa67650d01)
 that lets you do exactly that._


## Development/Testing
### _Use during development, remove from production_

| Feature                      | Plugin                                                                                                |
|------------------------------|-------------------------------------------------------------------------------------------------------|
| Inspect/Flush Rewrite Rules  | Rewrite Rules Inspector                                                                               |
| Switching between users      | User Switching                                                                                        |

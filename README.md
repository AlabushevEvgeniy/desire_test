# URL's for test Api app 'desire-test'

## Authors group

  * **list of all authors**

        GET "/api/v1/users"

  * **chosen author's posts**
  
        GET "api/v1/users/:id/posts"      
  
  * **favorites of chosen author**

        GET "/api/v1/users/:id/favorites"
  
  * **unread posts of chosen author**
  
        GET "api/v1/users/:id/unread"
  
## Posts group

  * **list of all posts**
  
        GET "/api/v1/posts"
  
  * **show chosen post**
  
        GET "api/v1/posts/:id"
  
  * **create post**
  
        POST "api/v1/posts"
  
  * **update chosen posts**
  
        PUT "/api/v1/posts/:id"
  
  * **delete chosen post**
  
        DELETE "/api/v1/posts/:id"
  
  * **add chosen post to current user's favorites**
  
        POST "api/v1/posts/:id/add_to_favorites"

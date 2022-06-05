<?php
/**
 * Reesouce URL : https://auth0.com/blog/developing-restful-apis-with-lumen-a-php-micro-framework/?utm_source=linkedingroup&utm_medium=sc&utm_campaign=php
 * The front end application will be built with ReactJs, VueJs and AngularJs.
 * However its needs to pull data from source and also push to it.
 * We need to bulid an API !.
 * We can considers authors as an resources, authors will have following attributes. i.e Name , Email, LinkedIn Profile, Github Profile, Location, .... etcs.
 * The API will provide endpoints for basic CRUD (Create, Read, Update, Delete) operations related to authors.
 * Those endpoints are as follows
 * Get All Authors list ---- GET  ----  /api/authors    -- index() methods.
 * Get One Authors Details-- GET  ---   /api/authors/23 -- view($id) methods.
 * Create an new Authors --- POST ---   /api/authors    -- create() methods.
 * Edit/Update an Authors -- PUT  ----  /api/authors/23 -- update($id) methods.
 * Delete an Authors ------- DELETE --- /api/authors/23 -- delete($id) methods.
 * API endpoints return a maximum of 50 results per response. 
 * When there are more results than can be returned in a response, 
 * include the page and per_page parameters in your request to retrieve more results.
 */
$response = {
    "name": "John Doe",
    "email": "john@john.ng",
    "twitter": "yemiwebby",
    "github": "yemiwebby",
    "location": "Nigeria",
    "latest_article_published": "Auth0_laravel"
  };
  response()->json();
  HTTP_OK -- 200 status code -- The request was successful.
  HTTP_CREATED -- 201 status code -- The new resouces Author was created.


  /**
   * Securing the API using auth.
   * A user sign with their credentials.
   * If the  user is authorized , then application is issued an API access token.
   * When user made API request , user will send API access token along with request.
   * If access token is valid , The API will respond with the requested data.
   * we can generate access token using JSON Web token known as JWT
   * https://jwt.io/introduction
   * We can make custom token system
   */
?>